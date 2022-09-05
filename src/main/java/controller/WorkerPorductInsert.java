package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDao;
import dto.Product;

@Controller
@RequestMapping("/workerpd")
public class WorkerPorductInsert {

	private ProductDao productdao;
	
	public WorkerPorductInsert setitemlist(ProductDao productdao) {
		this.productdao = productdao;
		return this;
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		
		return "workerPoductUpload";
	}
	 
	
	@RequestMapping(method = RequestMethod.POST)
	public String insert(HttpServletRequest request)throws ServletException, IOException{
		
		Product product = new Product();
		String itembns = null;
		String[] file_name = new String[6];
		int i = 1;
		
		String savePath = "D:\\javadata\\team\\src\\main\\webapp\\images\\product";	// ���⸦ �ٲ��ָ� �ٿ�޴� ��ΰ� �ٲ�
		int uploadFileSizeLimit = 10 * 1024 * 1024; // �ִ� ���ε� ���� ũ�� 5MB�� ����.
		String encType = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(request,savePath,
					uploadFileSizeLimit,encType,new DefaultFileRenamePolicy());
			
			// ���� �κ�
			file_name[0] = multi.getFilesystemName("uploadFile1");
			file_name[1] = multi.getFilesystemName("uploadFile2");
			file_name[2] = multi.getFilesystemName("uploadFile3");
			file_name[3] = multi.getFilesystemName("uploadFile4");
			file_name[4] = multi.getFilesystemName("uploadFile5");
			file_name[5] = multi.getFilesystemName("uploadFile6");
			
			
			// ��ǰ ��� �κ�.
			product.setItem_name(multi.getParameter("name"));
			product.setCompany_name(multi.getParameter("company"));
			product.setContent(multi.getParameter("content"));
			product.setSaleprice(Integer.parseInt(multi.getParameter("saleprice")));
			product.setRegularprice(Integer.parseInt(multi.getParameter("regularprice")));
			product.setItem_num(Integer.parseInt(multi.getParameter("itemnum")));
			product.setDistri_code(multi.getParameter("distri"));
			product.setKind(multi.getParameter("category"));
			product.setEvent_kind(multi.getParameter("event"));

			itembns = multi.getParameter("itemcheck");	
			
			if(itembns.equals("1")) {
				product.setBestyn("n");
				product.setNewyn("y");
			}
			else {
				product.setBestyn("y");
				product.setNewyn("n");
			}
			
			// ��ǰ ���.
			int buf = productdao.insertpd(product);
			
			if(buf != -1) {
				// �̹��� ���
				int pdmax = productdao.selectprodmax();
				
				System.out.println("max��"+pdmax);
	
				for(int j = 0; j < file_name.length; j++) {
					if(file_name[j] != null) {
						int buf2 = productdao.insertimage(pdmax,i, file_name[j]);
						if(buf2 == -1) System.out.println("�̹������� ����"+i);
						i++;						
					}
				}
				
				System.out.println("����Ϸ�");
			}
			else {
				System.out.println("�������");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		return "workerPoductUpload";
	}
	
	
}
