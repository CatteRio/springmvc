package com.yy.test;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rio
 * @Date 2018年4月3日 下午2:34:59
 */
public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("hello world");
	}

	@Test
	public void TestMap(){
		Map<Integer,String> testMap = new HashMap<>(16);
		testMap.put(1,"123");
		System.out.println(testMap.get(new Integer(1)));
		testMap.put(new Integer(1),"12345");
		System.out.println(testMap.get(new Integer(1)));
	}
}
