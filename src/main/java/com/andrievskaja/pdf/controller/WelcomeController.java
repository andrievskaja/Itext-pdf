package com.andrievskaja.pdf.controller;

import com.andrievskaja.form.BillsForm;
import com.andrievskaja.form.BillsServicesForm;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigDecimal;
import static java.math.BigDecimal.ROUND_DOWN;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.stringtemplate.v4.NoIndentWriter;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontProvider;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.stringtemplate.v4.ST;

@Controller
public class WelcomeController {

    public static final String FONT = "/FreeSans.ttf";
    @Autowired
    private ServletContext context;

    @RequestMapping("/")
    public String welcome(Model model, HttpServletRequest request) {
        String relativeWebPath = "img";
        String absoluteFilePath = context.getRealPath(relativeWebPath);
//        File uploadedFile = new File(absoluteFilePath);
        File file = new File(request.getSession().getServletContext().getRealPath("/img"));
        String[] fileList = file.list();

        model.addAttribute("webPath", relativeWebPath);
//        model.addAttribute("images", Arrays.asList(fileList));
        model.addAttribute("images", Arrays.asList("schet_ukr", "schet_de"));
        return "/welcome";
    }

    @RequestMapping(value = "/template", method = RequestMethod.GET, produces = "application/html;charset=utf-8")
    public String send(Model model, String template) throws IOException, ParseException {
        String relativeWebPath = "/templs-bils/" + template + "";
//        html = html.replaceAll("%date%",str).replaceAll("%phone%", "0965639362").replaceAll("%address%", user.getUsername() != null ? user.getUsername() : "");
        model.addAttribute("date", new Date());
        return relativeWebPath;
    }

    @RequestMapping(value = "/download")
    public ResponseEntity<ByteArrayResource> downloadFile2(BillsForm form) throws IOException, com.itextpdf.text.DocumentException {
        byte[] data = this.convertPdf(form);
        //download pdf file
        ByteArrayResource resource = new ByteArrayResource(data);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment;filename=" + form.getBillsName() + ".pdf")
                .contentType(MediaType.APPLICATION_PDF).contentLength(data.length)
                .body(resource);
    }

    private byte[] convertPdf(BillsForm form) throws IOException, DocumentException {
        String relativeWebPath = "templs_email/qr2.png";
        final ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
        final ByteArrayOutputStream pdfStream = new ByteArrayOutputStream();
        InputStream is = getClass().getResourceAsStream("/templs_email/" + form.getTemplete() + ".html");
        BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
        String sCurrentLine = "";
        String line = br.readLine();
        while (line
                != null) {
            sCurrentLine += line;
            line = br.readLine();
        }
        ST template = new ST(sCurrentLine, '$', '$');
        template.add("list", this.sum(form));

        Writer writer = new OutputStreamWriter(byteStream);
        template.write(new NoIndentWriter(writer));

        writer.flush();

        Document document = new Document(PageSize.A4);
        document.setMargins(60, 20, 30, 17);
        PdfWriter pdfWriter = PdfWriter.getInstance(document, pdfStream);
        document.open();

        //  image
        PdfContentByte canvas = pdfWriter.getDirectContentUnder();
        Image image = Image.getInstance(getClass().getClassLoader().getResource(relativeWebPath));
        image.setAbsolutePosition(60, 772);
        image.scaleAbsolute(56f, 56f);

        Image image1 = Image.getInstance(getClass().getClassLoader().getResource(relativeWebPath));
        image1.setAbsolutePosition(508, 772);
        image1.scaleAbsolute(50f, 50f);

        canvas.addImage(image);
        canvas.addImage(image1);

        //Font
        final BaseFont bf3 = BaseFont.createFont(FONT, form.getEncoding(), BaseFont.NOT_EMBEDDED);
        FontProvider fp = new FontProvider() {
            @Override
            public boolean isRegistered(String string) {
                return BaseFont.NOT_EMBEDDED;
            }

            @Override
            public Font getFont(String string, String string1, boolean bln, float f, int i, BaseColor bc) {
                return new Font(bf3, f, i, bc);
            }
        };
        InputStream initialStream = new ByteArrayInputStream(byteStream.toByteArray());
        XMLWorkerHelper.getInstance().parseXHtml(pdfWriter, document, initialStream, null, null, fp);

        document.close();
        return pdfStream.toByteArray();
    }
    private BillsForm sum(BillsForm form) {
        List<BillsServicesForm> table = form.getBillsServicesForm();

        BigDecimal allSumWithoutNds = BigDecimal.ZERO;
        BigDecimal allSumWithNds = BigDecimal.ZERO;
        BigDecimal allNds = BigDecimal.ZERO;

//        table.forEach((servicesForm) -> {
        for (BillsServicesForm servicesForm : table) {
            BigDecimal prize = BigDecimal.ZERO;
            if (servicesForm.getServicePrice() != null && servicesForm.getServiceCount() != null) {
                // payment amount by count
                BigDecimal servicePriceByCount = servicesForm.getServiceCount().multiply(servicesForm.getServicePrice());
                BigDecimal priceByCountAndNds;
                allSumWithoutNds = allSumWithoutNds.add(servicePriceByCount);
                BigDecimal serviceNds = (servicePriceByCount.multiply(form.getNds())).divide(new BigDecimal("100"));
                allNds = allNds.add(serviceNds);
                servicesForm.setServicePriceByCount(servicePriceByCount);
                servicesForm.setServiceNds(serviceNds.setScale(2, ROUND_DOWN));
                prize = servicesForm.getServicePrice();
                priceByCountAndNds = (servicePriceByCount.setScale(2, ROUND_DOWN)).add(serviceNds);
                servicesForm.setServicePriceByCountAndNds(priceByCountAndNds);
                allSumWithNds = allSumWithNds.add(priceByCountAndNds);
                servicesForm.setServicePriceByCount(servicesForm.getServicePriceByCount().setScale(2));
            }

        }

        form.setAllNds(allNds.setScale(2, ROUND_DOWN));
        form.setAllSumWithoutNds(allSumWithoutNds.setScale(2, ROUND_DOWN));
        form.setSumWithNds(allSumWithNds);
        return form;
    }
}
