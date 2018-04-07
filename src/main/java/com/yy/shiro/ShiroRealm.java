package com.yy.shiro;

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

import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.CommonUtils;

/**
 * @author Rio
 * @Date 2018年4月3日 下午3:09:15
 */
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private IUserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user = (User) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRole(user.getRole().trim());
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
		return new SimpleAuthenticationInfo(user,user.getPassword(), credentialsSalt, realmName);
	}

}
