package com.team6.promotions.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;

@Entity
@Table(name = "Promotions")
public class Promotions {

    @Id
    @Column(name = "Promotions_id")
    private String Promotions_id;

    @Column(name = "Promotions_name")
    private String Promotions_name;

    @Column(name = "Promotions_content")
    private String Promotions_content;

    @Column(name = "Promotions_picture")
    private String Promotions_picture;

    @Column(name = "Promotions_discount")
    private String Promotions_discount;

    @Column(name = "Promotions_discountcode")
    private String Promotions_discountcode;


    @Column(name = "Promotions_startdate")
    private LocalDate Promotions_startdate;

    @Column(name = "Promotions_enddate")
    private LocalDate Promotions_enddate;
//	----------------------




    public Promotions() {
    }

    public Promotions(String promotions_id, String promotions_name, String promotions_content, String promotions_picture, String promotions_discount, String promotions_discountcode, LocalDate promotions_startdate, LocalDate promotions_enddate) {
        Promotions_id = promotions_id;
        Promotions_name = promotions_name;
        Promotions_content = promotions_content;
        Promotions_picture = promotions_picture;
        Promotions_discount = promotions_discount;
        Promotions_discountcode = promotions_discountcode;
        Promotions_startdate = promotions_startdate;
        Promotions_enddate = promotions_enddate;
    }

    //	----------------------


    public String getPromotions_id() {
        return Promotions_id;
    }

    public void setPromotions_id(String promotions_id) {
        Promotions_id = promotions_id;
    }

    public String getPromotions_name() {
        return Promotions_name;
    }

    public void setPromotions_name(String promotions_name) {
        Promotions_name = promotions_name;
    }

    public String getPromotions_content() {
        return Promotions_content;
    }

    public void setPromotions_content(String promotions_content) {
        Promotions_content = promotions_content;
    }

    public String getPromotions_picture() {
        return Promotions_picture;
    }

    public void setPromotions_picture(String promotions_picture) {
        Promotions_picture = promotions_picture;
    }

    public String getPromotions_discount() {
        return Promotions_discount;
    }

    public void setPromotions_discount(String promotions_discount) {
        Promotions_discount = promotions_discount;
    }

    public String getPromotions_discountcode() {
        return Promotions_discountcode;
    }

    public void setPromotions_discountcode(String promotions_discountcode) {
        Promotions_discountcode = promotions_discountcode;
    }

    public LocalDate getPromotions_startdate() {
        return Promotions_startdate;
    }

    public void setPromotions_startdate(LocalDate promotions_startdate) {
        Promotions_startdate = promotions_startdate;
    }

    public LocalDate getPromotions_enddate() {
        return Promotions_enddate;
    }

    public void setPromotions_enddate(LocalDate promotions_enddate) {
        Promotions_enddate = promotions_enddate;
    }
}
