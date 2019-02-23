package com.yy.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
// @Service 都可以
public class TaskCool {
	/**
	 * 第一个定时器测试方法
	 */
	// 每五秒执行一次
//	@Scheduled(cron = "0/5 * * * * ?")
//	public void testJob() {
//		System.out.println("task first taskJob .... ");
//	}
}