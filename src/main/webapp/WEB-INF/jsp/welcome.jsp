<!DOCTYPE html>
<%@ page import="java.text.*,java.util.*" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="ru">
    <head>
        <meta charset="UTF-8"/>
        <title>Счета</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <link rel="shortcut icon" href="<c:url value="/img/favicon.png"/>">
        <link rel="stylesheet" type="text/css" href="css/reset.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="css/select.css">
        <link rel="stylesheet" href="css/sumoselect.min.css">
        <link rel="stylesheet" type="text/css" href="css/typography.css">
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/side-nav.css">
        <link rel="stylesheet" type="text/css" href="css/content.css">
        <link rel="stylesheet" href="css/bills.css">
        <link rel="stylesheet" href="css/bill-doc-style.css">
        <link rel="stylesheet" href="css/bill-doc-style-ukr.css">
        <link rel="stylesheet" type="text/css" href="js/jquery.toast.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="<c:url value="js/jquery-3.2.1.min.js"/>"></script>
        <script src="<c:url value="js/jquery.toast.min.js"/>"></script>
    </head>
    <body>
        <div class="content flex">
            <div class="page-header w-100 text-center">Cчета</div>
            <div class="content-innerwrap w-100 flex">
                <form action="${contextPath}/download" 
                      method="POST"
      
                      commandName="bilsForm"
                      accept-charset="UTF-8"
                      id="billsForm"
                      >
                    <input type="hidden" name="billsName" value="biils">
                    <input type="hidden" id="userType" name="userCompany">
                    <input type="hidden"   name="companyType" value="${companyType}">
                    <input type="hidden"   name="kunde"  id="kunde">
                    <input type="hidden" id="input-template" name="templete">
                    <input type="hidden"  name="encoding" value="Cp1251">
                    <div class="dropdown-btn change-theme w-100 flex" data-open="theme-dropdown">
                        <span class="w-100">Выберите шаблон письма</span>
                        <span class="angle-right"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                    </div>
                    <div class="dropdown-list w-100 hidden theme-dropdown">
                        <div class="theme-innerwrap flex">
                            <c:forEach var="image" items="${images}" varStatus="loop">
                                <%--<c:set var="imageName" value="${fn:substring(image,0, image.length()-4)}" />--%>
                                <div class="theme-block">
                                    <input class="theme-check checkbox-templete" 
                                           value="${image}" 
                                           id="${loop.index}" 
                                           name="theme-check"
                                           type="radio"
                                           ${loop.index ==0?"checked":""}
                                           >
                                    <label for="${loop.index}"><img class="img-responsive" src="${webPath}/${image}.jpg" alt=""></label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="input-wrap w-100">
                        <input class="service-enter" 
                               data-class='email' 
                               name="email" 
                               type="text"                             
                               placeholder="Email для отправки">
                    </div>
                    <div class="input-wrap w-100">
                        <input class="service-enter" 
                               data-class='bilsData' 
                               name="data"  
                               type="text" 
                               placeholder="Дата"
                               id="datepicker-bils">
                    </div>
                    <div class="input-wrap w-100">
                        <input class="service-enter" 
                               data-class='billNumber' 
                               name="billNumber"  
                               type="text" 
                               placeholder="Номер счета">
                    </div>
                    <div class="input-wrap w-100">
                        <input class="service-enter" 
                               data-class='contractNumber' 
                               name="contractNumber" 
                               type="text" 
                               placeholder="Номер договора">
                    </div>
                    <div class="input-wrap w-100 company-taxNumber">
                        <input class="service-enter" 
                               data-class='taxNumber'                               
                               type="text"
                               placeholder="Налоговый номер">
                    </div>

                    <div class="input-wrap w-100">
                        <input class="service-enter address" 
                               data-class='address'  
                               name="address" 
                               type="text"  
                               placeholder="Адрес">
                    </div>
                    <div class="input-wrap w-100">
                        <input class="service-enter phone"
                               data-class='phone'
                               name="phone"                          
                               type="text" 
                               placeholder="Телефон">
                    </div>
                    <div class="services">
                        <div class="service" data-row="0">
                            <div class="input-wrap w-100">
                                <textarea class="service-text service-enter" 
                                          name='billsServicesForm[0].serviceName' 
                                          data-class='serviceName' 
                                          placeholder="Наименование услуги">
                                </textarea>                      
                            </div>
                            <div class="amount flex">
                                <div class="input-wrap ">
                                    <input type="number" 
                                           class="service-enter" 
                                           onkeypress='validate(event)' 
                                           name='billsServicesForm[0].serviceCount' 
                                           data-class='serviceCount'
                                           placeholder="Кол-во">
                                </div>
                                <div class="input-wrap">
                                    <input type="number" 
                                           class="service-enter"  
                                           onkeypress='validate(event)' 
                                           name='billsServicesForm[0].servicePrice' 
                                           data-class='servicePrice' 
                                           placeholder="Цена">
                                </div>
                                <button type="button" class="add-btn add-field">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="input-wrap select">
                        <select name="" id="select-nds" >
                            <option value="19">НДС 19%</option>
                            <option value="20">НДС 20%</option>

                        </select>
                        <span class="angle"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                    </div>
                    <div class="btn-wrap flex">
                        <button id="savePdf" type="button"   class="btn action-btn">Сохранить в pdf</button>
                        <button id="sendBills" type="button" class="btn action-btn">Отправить EMAIL</button>
                    </div>
                </form>
                <div class="service template hidden">
                    <div class="input-wrap w-100">
                        <textarea class="service-text service-enter" name='billsServicesForm[1].serviceName' data-class='serviceName' data-target='' placeholder="Наименование услуги"></textarea>
                    </div>
                    <div class="amount flex">
                        <div class="input-wrap">
                            <input type="number" class="service-enter"  onkeypress='validate(event)' name='billsServicesForm[1].serviceCount' data-class='serviceCount' placeholder="Кол-во">
                        </div>
                        <div class="input-wrap">
                            <input type="number" class="service-enter"  onkeypress='validate(event)' name='billsServicesForm[1].servicePrice' data-class='servicePrice' placeholder="Цена">
                        </div>
                        <button type="button" class="add-btn add-field">+</button>
                    </div>
                </div>
                <!--                <iframe  with="375px;" height="700px;" id="send-iframe" src="javascript:false">
                
                                </iframe>-->
                <div class="bill-wrap" id="bils-insert">

                </div>
            </div>
        </div>
        <script src="<c:url value="/js/html.js"/>"></script>
        <script src="<c:url value="/js/select2.min.js"/>"></script>
        <script src="<c:url value="/js/bills.js"/>"></script>
        <script src="<c:url value="/js/jquery-ui.js"/>"></script>

        <script>

                                $(".checkbox-templete").change(function () {
                                    if ($('.checkbox-templete:checked').length > 0) {
                                        $("#input-template").val($(this).val());
                                        $.get('${pageContext.servletContext.contextPath}/template', {template: $(this).val()}, function (data) {
//                                            var bils = $("#bils-iframe").contents().find('html').html(data);
                                            $("#bils-insert").html(data);
                                            $("#datepicker-bils").removeAttr("disabled");
                                            $("div.client-change").addClass('dropdown-btn');
                                            user_open();
                                        });
                                    } else {
                                        $("#bils-insert").html("<p>Выберете шаблон</p>");
                                    }
                                });

                                $(".chk").click(function () {
                                    $(".kunde span").text(this.value);
                                    $("#kunde").val(this.value);
                                    var type = $(this).attr("user-type");
                                    var user_phone = $(this).attr("user-phone");
                                    var user_address = $(this).attr("user-address");
                                    var user_company_address = $(this).attr("user-company-address");
                                    var user_email = $(this).attr("user-email");

                                    $(".email").val(user_email);
                                    $(".email span").text(user_email);
                                    $(".phone").val(user_phone);
                                    $(".phone span").text(user_phone);

                                    if (type === 'person') {
                                        $(".company-taxNumber").hide();
                                        $("#userType").val(false);
                                        $(".address").val(user_address);
                                        $(".address span").text(user_address);
                                    } else {
                                        $(".company-taxNumber").show();
                                        $("#userType").val(true);
                                        $(".address").val(user_company_address);
                                        $(".address span").text(user_company_address);
                                    }
                                    console.log();
                                });

                                $('select').select2({
                                    minimumResultsForSearch: Infinity,
                                    width: '100%'
                                });

                                function validate(evt) {
                                    var theEvent = evt || window.event;
                                    var key = theEvent.keyCode || theEvent.which;
                                    key = String.fromCharCode(key);
                                    var regex = /[0-9]|\./;
                                    if (!regex.test(key)) {
                                        theEvent.returnValue = false;
                                        if (theEvent.preventDefault)
                                            theEvent.preventDefault();
                                    }
                                }
                                $(document).on('change', '#select-nds', function () {
                                    var nds = $("#select-nds").val();
                                    $("#td-nds span").text(nds);
                                });
                                $("#savePdf").click(function () {
                                    console.log($('.checkbox-templete:checked').length);
                                    console.log($('.chk:checked').length);
                                    if ($('.checkbox-templete:checked').length === 0) {
                                        $.toast({
                                            text: 'Выберите шаблон счета',
                                            hideAfter: 10000,
                                            stack: 5,
                                            icon: 'error',
                                            loader: false
                                        });
                                    } else if ($('.checkbox-templete:checked').length > 0) {
                                        $("#billsForm").submit();
                                    }
                                });

                                $(function () {
                                    $("#datepicker-bils").datepicker({dateFormat: 'dd/mm/yy'}).datepicker("setDate", new Date());
                                });
                                
                                var isSelectUser = function () {
                                    return $(".chk").length > 0;
                                };
                                
                                $("#sendBills").click(function () {
                                    var formObj1 = $('form').serialize();
                                    var formURL = "/sendEmail";
                                    if ($('.chk:checked').length !== 0) {
                                        $.post(formURL, formObj1, function (data) {
                                            $.toast({
                                                text: data,
                                                hideAfter: 10000,
                                                stack: 5,
                                                loader: false
                                            });
                                        });
                                    } else {
                                        $.toast({
                                            text: 'Выберите пользователя(ей) которому будет отправлено письмо, поле Клиент(Название)',
                                            hideAfter: 10000,
                                            stack: 5,
                                            icon: 'error',
                                            loader: false
                                        });
                                    }
                                });


        </script>
    </body>
</html>