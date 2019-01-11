package com.yy.shiro;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.yy.pojo.Premission;
import com.yy.pojo.Role;
import com.yy.pojo.User;
import com.yy.service.IPremissionService;
import com.yy.service.IUserService;
import com.yy.utils.PremissionTreeBuilder;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:16:01
 */
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private IUserService userService;

	@Autowired
	IPremissionService premissionService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("doGetAuthorizationInfo");
		User user = (User) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<Premission> permissions = premissionService.selectPremissionByUserId(user.getId());
		for (Role role : user.getRoles()) {
			info.addRole(role.getRole());
		}
		for (Premission premission : permissions) {
			info.addStringPermission(premission.getContent());
		}

		user.setPremissions(PremissionTreeBuilder.buildByRecursive(permissions));
		// ShiroUtils.setSessionAttribute("premissions",
		// PremissionTreeBuilder.buildByRecursive(premissions));
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName = (String) token.getPrincipal();
		User user = userService.findUserByUserName(userName);
		if (user == null)
			return null; // 异常处理，找不到数据
		String realmName = this.getName();
		ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
		return new SimpleAuthenticationInfo(user, user.getPassword(), credentialsSalt, realmName);
	}

	public void clearCachedAuthorizationInfo() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}
}
