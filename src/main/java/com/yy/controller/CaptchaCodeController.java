package com.yy.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.Hash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 上午9:48:08
 */
@Controller
public class CaptchaCodeController {
	private int width = 115;// 定义图片的width
	private int height = 43;// 定义图片的height
	private int codeCount = 4;// 定义图片上显示验证码的个数
	private int xx = 25;
	private int fontHeight = 40;
	private int codeY = 37;
	char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
			'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	@RequestMapping("/captcha.do")
	public void getCaptcha(HttpServletResponse response, HttpSession session) throws IOException {
		// 定义图像buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics gd = buffImg.getGraphics();
		Random random = new Random();
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);
		Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		gd.setFont(font);
		gd.setColor(Color.BLACK);
		gd.drawRect(0, 0, width - 1, height - 1);
		gd.setColor(Color.BLACK);
		for (int i = 0; i < 40; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}
		StringBuffer randomCode = new StringBuffer();
		int red = 0, green = 0, blue = 0;
		for (int i = 0; i < codeCount; i++) {
			String code = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
			red = random.nextInt(255);
			green = random.nextInt(255);
			blue = random.nextInt(255);
			gd.setColor(new Color(red, green, blue));
			gd.drawString(code, i * xx + 8, codeY);
			randomCode.append(code);
		}
		session.setAttribute("captcha", randomCode.toString());
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream sos = response.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();
	}

}
