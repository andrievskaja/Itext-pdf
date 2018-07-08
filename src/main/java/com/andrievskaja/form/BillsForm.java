/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andrievskaja.form;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author Людмила
 */
public class BillsForm implements Serializable {

    private String templete;
    private String data;
    private String nameTemplate;
    private String client;
    private String billNumber;
    private String contractNumber;
//    private String taxNumber;
    private String address;
    private String email;
//    private String tax;
    private String phone;
    private List<BillsServicesForm> billsServicesForm;
    private String billsName;
    private BigDecimal allSumWithoutNds;
    private BigDecimal sumWithNds;
    private BigDecimal allNds;
    private final BigDecimal nds = new BigDecimal("19");
    private String kunde;
    private String encoding = "Cp1251";
    private boolean countLine;

    public BigDecimal getAllSumWithoutNds() {
        return allSumWithoutNds;
    }

    public void setAllSumWithoutNds(BigDecimal allSumWithoutNds) {
        this.allSumWithoutNds = allSumWithoutNds;
    }

    public BigDecimal getSumWithNds() {
        return sumWithNds;
    }

    public void setSumWithNds(BigDecimal sumWithNds) {
        this.sumWithNds = sumWithNds;
    }

    public BigDecimal getAllNds() {
        return allNds;
    }

    public void setAllNds(BigDecimal allNds) {
        this.allNds = allNds;
    }

    public BigDecimal getNds() {
        return nds;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }



    public String getNameTemplate() {
        return nameTemplate;
    }

    public void setNameTemplate(String nameTemplate) {
        this.nameTemplate = nameTemplate;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getBillNumber() {
        return billNumber;
    }

    public void setBillNumber(String billNumber) {
        this.billNumber = billNumber;
    }

    public String getContractNumber() {
        return contractNumber;
    }

    public void setContractNumber(String contractNumber) {
        this.contractNumber = contractNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<BillsServicesForm> getBillsServicesForm() {
        return billsServicesForm;
    }

    public void setBillsServicesForm(List<BillsServicesForm> billsServicesForm) {
        this.billsServicesForm = billsServicesForm;
    }

    public String getBillsName() {
        return billsName;
    }

    public void setBillsName(String billsName) {
        this.billsName = billsName;
    }

    public boolean isCountLine() {
        return countLine;
    }

    public void setCountLine(boolean countLine) {
        this.countLine = countLine;
    }

    public String getTemplete() {
        return templete;
    }

    public void setTemplete(String templete) {
        this.templete = templete;
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }
}
