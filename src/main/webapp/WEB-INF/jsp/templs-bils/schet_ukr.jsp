<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>           

<div id="container-paper" style="padding: 20px; position: relative; margin: 0 auto;font-family: 'Istok Web', sans-serif;">
    <div style="height: 95px;border-bottom: 1pt solid #4D6DA7;">
        <img style="width: 56px; height: 56px;float: left;" src="img/logo1.png" alt="Sloyev">
        <img style="width: 56px;height: 56px;float: right;" src="img/qr2.png" alt="QRCode" class="qrcode right">
    </div>
    <div id="content-paper" style="padding-top: 30pt;">
        <h1 style="font-size: 14pt;color: #4C6FAF;text-align: center;font-weight: 700;">Рахунок на оплату № 3 від 18 січня 2018р.</h1>
        <div id="content-paper-wrapper">
            <div style="color: #2A2A2A;font-size: 10pt;margin-top: 30px;" class="client-info">

                <table style="width: 100%;font-size: 12px">
              <div id="client-info" class="left">
                    <p class="info-text bilsData">Дата:  <span><fmt:formatDate pattern="dd/MM/yyyy" value="${date}"/> </span></p>
                    <p class="info-text billNumber">№ Счета.:  <span></span></p>
                    <p class="info-text contractNumber">Договор: <span></span></p>
                    <p class="info-text address" id="address">Адресс:  <span></span></p>
                    <p class="info-text phone">Телефон:  <span></span></p>
                    <p class="info-text email">E-mail::  <span></span></p>

                </div>

                   <div id="company-info" class="right">
                    <p class="info-text">Иванов Иван</p>
                    <p class="info-text">Набережная победы 28</p>
                    <p class="info-text">49000 Днепр</p>
                    <p class="info-text">П/р: 260015022332б</p>
                    <p class="info-text">Tel. 3700</p>
                    <p class="info-text email 1" data-target="1">E-mail: info@privat.com</p>
                    <p class="info-text">Украина Днепр,</p>
                    <p class="info-text">МФО 23224</p>
                    <p class="info-text">Получатель Иванова Иванна</p>
                </div>
                </table>

            </div>
            <table id="main-table" cellspacing="0" cellpadding="0" style="table-layout: fixed;margin-top: 40pt;width: 100%;">
                <thead>
                    <tr class="main-table-tr">
                        <th style="width: 50px;">№</th>
                        <th style="width: 40%;">Товари (роботи, послуги)</th>
                        <th style="width: 50px;">Кількість</th>
                        <th style="">Од.</th>
                        <th style="">Ціна</th>
                        <th style="">Сума</th>
                    </tr>
                </thead>

                <tr class="main-table-tr template hidden" >
                    <td class="main-td first-td"></td>
                    <td class="main-td second-td serviceName"><span></span></td>
                    <td class="main-td serviceCount"><span>0</span></td>
                    <td class="main-td servicePrice"><span>0</span> </td>
                    <td class="main-td serviceTax"><span>0</span> </td>
                    <td class="main-td serviceResult last-td"><span>0</span> </td>
                </tr>

                <tr class="main-table-tr" data-row="0">
                    <td class="main-td first-td">1</td>
                    <td class="main-td second-td serviceName"><span></span></td>
                    <td class="main-td serviceCount"><span>0</span></td>
                    <td class="main-td servicePrice"><span>0</span> </td>
                    <td class="main-td serviceTax"><span>0</span></td>
                    <td class="main-td serviceResult last-td"><span>0</span> </td>
                </tr>
            </table>	
            <table id="dop-table-one" style="margin-top: 53px;width: 100%;" cellspacing="0" cellpadding="0">
                <tr class="dop-one-tr">
                    <th class="dop-table-one-th" style="font-size: 12px;font-weight: 700;text-align: left;">Счет</th>
                    <th class="dop-table-one-th">Ціна без ПДВ</th>
                    <th class="dop-table-one-th">ПДВ</th>
                    <th class="dop-table-one-th">Сума</th>
                </tr>
                <tr class="dop-one-tr">
                    <td class="dop-table-one-td"></td>
                    <td class="dop-table-one-td all-sum-with-out-nds"><span>0</span> гр.</td>
                    <td class="dop-table-one-td all-tax"><span>0</span> гр.</td>
                    <td class="dop-table-one-td all-sum"><span>0</span> гр.</td>
                </tr>
            </table>	
            <table id="dop-table-two" style="margin-top: 40pt; width: 100%" cellspacing="0" cellpadding="0">
                <tr class="dop-two-tr">
                    <th class="dop-table-one-th" style="font-weight: 700;font-size: 12px;">Розрахункова строка</th>
                    <th class="dop-table-one-th">Процент ПДВ</th>
                    <th class="dop-table-one-th">Ціна без ПДВ</th>
                    <th class="dop-table-one-th">ПДВ</th>
                </tr>
                <tr class="dop-two-tr">
                    <td class="dop-table-one-td"></td>
                    <td class="dop-table-one-td" id="td-nds"><span>19</span>%</td>
                    <td class="dop-table-one-td all-sum-with-out-nds"><span>0</span> гр.</td>
                    <td class="dop-table-one-td all-tax"><span>0</span> гр.</td>
                </tr>
            </table>	
        </div>
    </div>
</div>
