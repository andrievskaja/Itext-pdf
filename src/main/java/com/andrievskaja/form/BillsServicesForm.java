
package com.andrievskaja.form;

import java.io.Serializable;
import java.math.BigDecimal;

public class BillsServicesForm implements Serializable{
    private String serviceName;
    private BigDecimal serviceCount;
    private BigDecimal servicePrice;
    private BigDecimal servicePriceByCount;
    private BigDecimal servicePriceByCountAndNds;
    private BigDecimal serviceNds;

    public BigDecimal getServicePriceByCountAndNds() {
        return servicePriceByCountAndNds;
    }

    public void setServicePriceByCountAndNds(BigDecimal servicePriceByCountAndNds) {
        this.servicePriceByCountAndNds = servicePriceByCountAndNds;
    }

    
    public BigDecimal getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(BigDecimal servicePrice) {
        this.servicePrice = servicePrice;
    }

    public BigDecimal getServicePriceByCount() {
        return servicePriceByCount;
    }

    public void setServicePriceByCount(BigDecimal servicePriceByCount) {
        this.servicePriceByCount = servicePriceByCount;
    }

    public BigDecimal getServiceNds() {
        return serviceNds;
    }

    public void setServiceNds(BigDecimal serviceNds) {
        this.serviceNds = serviceNds;
    }


    public BillsServicesForm() {
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public BigDecimal getServiceCount() {
        return serviceCount;
    }

    public void setServiceCount(BigDecimal serviceCount) {
        this.serviceCount = serviceCount;
    }
  
}
