package com.yy.utils;

import java.util.ArrayList;
import java.util.List;

import com.yy.pojo.Permission;

/**
 * @author Rio(417168602@qq.com)
 * @date 2018-04-27 下午4:31:18
 */
public class PremissionTreeBuilder {

	public static List<Permission> bulid(List<Permission> permissions) {

		List<Permission> trees = new ArrayList<Permission>();

		for (Permission permission : permissions) {

			if (permission.getParentid() == null) {
				trees.add(permission);
			}

			for (Permission it : permissions) {
				if (it.getParentid() == permission.getId()) {
					if (permission.getChildren() == null) {
						permission.setChildren(new ArrayList<Permission>());
					}
					permission.getChildren().add(it);
				}
			}
		}
		return trees;
	}

	/**
	 * 使用递归方法建树
	 * @param permissions
	 * @return
	 */
	public static List<Permission> buildByRecursive(List<Permission> permissions) {
		List<Permission> trees = new ArrayList<Permission>();
		for (Permission permission : permissions) {
			if (permission.getParentid() == null) {
				trees.add(findChildren(permission, permissions));
			}
		}
		return trees;
	}

	/**
	 * 递归查找子节点
	 * @param permission
	 * @param permissions
	 * @return
	 */
	public static Permission findChildren(Permission permission, List<Permission> permissions) {
		for (Permission it : permissions) {
			if (permission.getId().equals(it.getParentid())) {
				if (permission.getChildren() == null) {
					permission.setChildren(new ArrayList<Permission>());
				}
				permission.getChildren().add(findChildren(it, permissions));
			}
		}
		return permission;
	}

}
