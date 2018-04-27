package com.yy.utils;

import java.util.ArrayList;
import java.util.List;

import com.yy.pojo.Premission;

/**
 * @author Rio(417168602@qq.com)
 * @date 2018-04-27 下午4:31:18
 */
public class PremissionTreeBuilder {

	public static List<Premission> bulid(List<Premission> premissions) {

		List<Premission> trees = new ArrayList<Premission>();

		for (Premission premission : premissions) {

			if (premission.getParentid() == null) {
				trees.add(premission);
			}

			for (Premission it : premissions) {
				if (it.getParentid() == premission.getId()) {
					if (premission.getChildren() == null) {
						premission.setChildren(new ArrayList<Premission>());
					}
					premission.getChildren().add(it);
				}
			}
		}
		return trees;
	}

	/**
	 * 使用递归方法建树
	 * 
	 * @param Premissions
	 * @return
	 */
	public static List<Premission> buildByRecursive(List<Premission> premissions) {
		List<Premission> trees = new ArrayList<Premission>();
		for (Premission premission : premissions) {
			if (premission.getParentid() == null) {
				trees.add(findChildren(premission, premissions));
			}
		}
		return trees;
	}

	/**
	 * 递归查找子节点
	 * 
	 * @param Premissions
	 * @return
	 */
	public static Premission findChildren(Premission premission, List<Premission> premissions) {
		for (Premission it : premissions) {
			if (premission.getId().equals(it.getParentid())) {
				if (premission.getChildren() == null) {
					premission.setChildren(new ArrayList<Premission>());
				}
				premission.getChildren().add(findChildren(it, premissions));
			}
		}
		return premission;
	}

}
