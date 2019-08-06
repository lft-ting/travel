package com.lft.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.catalina.tribes.util.Arrays;

/**
 * MD5加密工具类
 */
public class MD5Util {

	private static final char[] HEXS = new char[]{'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
	
	/**
	 * MD5算法加密
	 * @param source 待加密的字符串
	 * @return 加密后的新字符串
	 */
	public static String md5(String source)
	{
		try {
			//1.返回实现指定摘要算法的 MessageDigest 对象
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");

			//2.字符串 -> 字节数组byte[]
			byte[] input = source.getBytes();
			
			//3.使用指定的 byte 数组更新摘要
			messageDigest.update(input);
			
			//4.通过执行诸如填充之类的最终操作完成哈希计算，得到长度为16的字节数组byte[]
			byte[] contents = messageDigest.digest();
			
			//{95, -92, 101, -14, -25, 76, 78, 110, -126, -75, 16, 65, -29, 109, -28, -104}
			System.out.println("byte数组的长度：" + contents.length);//长度为16
			System.out.println(Arrays.toString(contents));
			
			//5.把128位（byte[]16字节）的MD5散列被表示为长度为32位十六进制数字----1字节 = 8位
			/*byte c = -92;
			System.out.println(Integer.toBinaryString(c));      	//  111111111111111111111111 1010 0100
			System.out.println(Integer.toBinaryString(c >>> 4));	//  111111111111111111111111 1010                 往右移除4位，保留左边四位  
																	//& 000000000000000000000000 1111			
			System.out.println(Integer.toBinaryString(c >>> 4 & 0xF));//000000000000000000000000 1010	为把其他的无效位1去除，需要与F做与运算	
			
			
			System.out.println(Integer.toBinaryString(c));		//  111111111111111111111111 1010 0100
													      		//& 000000000000000000000000 0000 1111    为把其他的无效位1去除，需要与F做与运算	
			System.out.println(Integer.toBinaryString(c & 0xF));//  000000000000000000000000 0000 0100    右边的四位
			
			System.out.println(c >>> 4 & 0xF);//10  十进制
			System.out.println(c & 0xF);	  //4 
			
			System.out.println(Integer.toHexString(c >>> 4 & 0xF));//a 十六进制
			System.out.println(Integer.toHexString(c & 0xF));	   //4
			
			System.out.println(HEXS[c >>> 4 & 0xF]);//A
			System.out.println(HEXS[c & 0xF]);      //4*/
			
			char[] result = new char[contents.length * 2];
			int k = 0;
			for (int i = 0; i < contents.length; i++) {
				byte c = contents[i];
				
				result[k++] = HEXS[c >>> 4 & 0xF];//左边的四位
				result[k++] = HEXS[c & 0xF];//右边的四位
			}
					
			return new String(result);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		
		String password = "123";
		System.out.println(md5(password));
		
	}
	
}
