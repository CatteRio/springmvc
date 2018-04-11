package com.yy.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

/**
 * @author Rio 2018年4月6日上午1:01:54
 */
public class CommonUtils {

	public static String randomSalt() {
		char[] chars = "0123456789abcdefghijklmnopqrwtuvzxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
		char[] saltchars = new char[16];
		Random RANDOM = new SecureRandom();
		for (int i = 0; i < 16; i++) {
			int n = RANDOM.nextInt(62);
			saltchars[i] = chars[n];
		}
		return new String(saltchars);
	}

	public static String MD5(String s) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(s.getBytes("utf-8"));
			return toHex(bytes);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static String toHex(byte[] bytes) {

		final char[] HEX_DIGITS = "0123456789abcdef".toCharArray();
		StringBuilder ret = new StringBuilder(bytes.length * 2);
		for (int i = 0; i < bytes.length; i++) {
			ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
			ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
		}
		return ret.toString();
	}

	/**
	 * 生成摘要
	 * 
	 * @param password
	 * @param salt
	 * @return
	 */
	public static byte[] digest(String password, byte[] salt) {

		try {
			MessageDigest msgDigest = MessageDigest.getInstance("md5");
			if (salt != null && salt.length > 0) {
				msgDigest.update(salt);
			}

			byte[] digest = msgDigest.digest(password.getBytes());
			return digest;
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
	}

	public static void main(String[] args) {
		System.out.println(toHex(digest("21232f297a57a5a743894a0e4a801fc3","WB9KdQmj10WeKyZf".getBytes())));
	}
}
