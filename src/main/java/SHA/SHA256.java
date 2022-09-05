package SHA;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {

	// ��ȣȭ ��ų StringŸ���� ��ü�� �����´�.
	public String encrypt(String text) throws NoSuchAlgorithmException{
		
		// �ڹ� �ؽ� Ŭ���� ���.
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		
		// ������ byte ������ �����͸� ����� digest�� �����Ѵ�.
		md.update(text.getBytes());
		
		// ����Ʈ �迭�� �ؽ��� ��ȯ. 
		return bytesToHex(md.digest());
		
	}
	
	
	private String bytesToHex(byte[] bytes) {
		
		StringBuilder builder = new StringBuilder();
		
		// 16����(���)�� ����
		for(byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		
		// ���ڿ��� ����� ����.
		return builder.toString();
		
	}
	
}
