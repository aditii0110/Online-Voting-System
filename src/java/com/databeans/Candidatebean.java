/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.databeans;


public class Candidatebean {
    String Name,MobileNo,Cgpa,Post,Skills;

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getMobileNo() {
        return MobileNo;
    }

    public void setMobileNo(String MobileNo) {
        this.MobileNo = MobileNo;
    }

    public String getCgpa() {
        return Cgpa;
    }

    public void setCgpa(String Cgpa) {
        this.Cgpa = Cgpa;
    }

    public String getPost() {
        return Post;
    }

    public void setPost(String Post) {
        this.Post = Post;
    }

    public String getSkills() {
        return Skills;
    }

    public void setSkills(String Skills) {
        this.Skills = Skills;
    }

    public int getScholarNo() {
        return ScholarNo;
    }

    public void setScholarNo(int ScholarNo) {
        this.ScholarNo = ScholarNo;
    }
    int ScholarNo;
    
}
