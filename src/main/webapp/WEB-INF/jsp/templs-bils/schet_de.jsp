<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="container-paper">
    <div id="header-paper" class="clearfix">
        <img style="width: 56px; height: 56px;" src="img/logo1.png" alt="Sloyev" class="logo left">
        <img style="width: 56px; height: 56px;" src="img/qr2.png" alt="QRCode" class="qrcode right">
    </div>
    <div id="content-paper">
        <h1 class="doc-name">Счет</h1>
        <div id="content-paper-wrapper">
            <!--<div id="info" class="clearfix">-->
                <div id="client-info" class="left">
                    <p class="info-text bilsData">Дата:  <span><fmt:formatDate pattern="dd/MM/yyyy" value="${date}"/> </span></p>
                    <p class="info-text billNumber">№ Счета.:  <span></span></p>
                    <p class="info-text contractNumber">Договор: <span></span></p>

                    <p class="info-text address" id="address">Адресс:  <span></span></p>
                    <p class="info-text taxNumber company-taxNumber">Без НДС:  <span> </span></p>
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
            <!--</div>-->
            <table id="main-table" cellspacing="0" cellpadding="0">
                <thead>
                    <tr class="main-table-tr">
                        <th class="main-th">№</th>
                        <th class="main-th">Описание</th>
                        <th class="main-th">Количество</th>
                        <th class="main-th">Цена без НДС, гр.</th>
                        <th class="main-th">НДС, гр.</th>
                        <th class="main-th">Сумма, гр.</th>
                    </tr>
                </thead>

                <tr class="main-table-tr template hidden">
                    <td class="main-td first-td"></td>
                    <td class="main-td second-td serviceName"><span></span></td>
                    <td class="main-td serviceCount"><span></span></td>
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
            <table id="dop-table-one" class="dop-table" cellspacing="0" cellpadding="0">
                <tr class="dop-one-tr">
                    <th class="dop-table-one-th">Счет</th>
                    <th class="dop-table-one-th">Цена без НДС</th>
                    <th class="dop-table-one-th">НДС</th>
                    <th class="dop-table-one-th">Сумма</th>
                </tr>
                <tr class="dop-one-tr">
                    <td class="dop-table-one-td"></td>
                    <td class="dop-table-one-td all-sum-with-out-nds"><span>0</span> €</td>
                    <td class="dop-table-one-td all-tax"><span>0</span> €</td>
                    <td class="dop-table-one-td all-sum"><span>0</span> €</td>
                </tr>
            </table>	
            <table id="dop-table-two" cellspacing="0" cellpadding="0">
                <tr class="dop-two-tr">
                    <th class="dop-table-one-th two-first">НДС</th>
                    <th class="dop-table-one-th">Ставка НДС</th>
                    <th class="dop-table-one-th">Сумма без НДС</th>
                    <th class="dop-table-one-th">Сумма НДС</th>
                </tr>
                <tr class="dop-two-tr">
                    <td class="dop-table-one-td"></td>
                    <td class="dop-table-one-td" id="td-nds"><span>19</span>%</td>
                    <td class="dop-table-one-td all-sum-with-out-nds"><span>0</span> €</td>
                    <td class="dop-table-one-td all-tax"><span>0</span> €</td>
                </tr>
            </table>	
        </div>
    </div>
    <div id="footer-paper">
        <div id="footer-info">
            <div id="footer-left">
                <p class="info-text">Банк</p>
                <p class="info-text">ПриватБанк, Днепр</p>
                <p class="info-text">Индекс: 49000</p>
                <p class="info-text">Номер счета: 133588400</p>
            </div>
            <div id="footer-mdl">
                <p class="info-text">support@privat.com</p>
                <p class="info-text"> <fmt:formatDate pattern="dd.MM.yyyy" value="${date}"/></p>
            </div>
            <div id="footer-right">
                <p class="info-text">privat.com</p>
            </div>
        </div>
    </div>
</div>
<script>
$(".company-taxNumber").hide();
</script>