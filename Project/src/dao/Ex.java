package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.bind.DatatypeConverter;
public class Ex {

	public static void main(String[] args) throws NoSuchAlgorithmException {

		//ハッシュを生成したい元の文字列
				String source = "admin";
				//ハッシュ生成前にバイト配列に置き換える際のCharset
				Charset charset = StandardCharsets.UTF_8;
				//ハッシュアルゴリズム
				String algorithm = "MD5";

				//ハッシュ生成処理
				byte[] bytes = null;
				
					bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
				String result = DatatypeConverter.printHexBinary(bytes);
				//標準出
		System.out.println(result);
	}
}
//5F4DCC3B5AA765D61D8327DEB882CF99