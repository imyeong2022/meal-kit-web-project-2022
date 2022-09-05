package dto;

import java.sql.Timestamp;

public class Product {

	private int prod_cd;
	private int item_num;
	private String item_name;
	private int regularprice;
	private int saleprice;
	private String content;
	private String kind;
	private String useyn;
	private String bestyn;
	private String newyn;
	private String company_name;
	private String distri_code;
	private Timestamp indate;
	private int pimage_cd;
	private int image_num;
	private String image;
	private String event_kind;
	private int salerate;
	
	public String getEvent_kind() {
		return event_kind;
	}
	public void setEvent_kind(String event_kind) {
		this.event_kind = event_kind;
	}
	public int getSalerate() {
		return salerate;
	}
	public void setSalerate(int salerate) {
		this.salerate = salerate;
	}
	public int getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(int prod_cd) {
		this.prod_cd = prod_cd;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getRegularprice() {
		return regularprice;
	}
	public void setRegularprice(int regularprice) {
		this.regularprice = regularprice;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

	public String getBestyn() {
		return bestyn;
	}
	public void setBestyn(String bestyn) {
		this.bestyn = bestyn;
	}
	public String getNewyn() {
		return newyn;
	}
	public void setNewyn(String newyn) {
		this.newyn = newyn;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getDistri_code() {
		return distri_code;
	}
	public void setDistri_code(String distri_code) {
		this.distri_code = distri_code;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public int getPimage_cd() {
		return pimage_cd;
	}
	public void setPimage_cd(int pimage_cd) {
		this.pimage_cd = pimage_cd;
	}
	public int getImage_num() {
		return image_num;
	}
	public void setImage_num(int image_num) {
		this.image_num = image_num;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	
}
