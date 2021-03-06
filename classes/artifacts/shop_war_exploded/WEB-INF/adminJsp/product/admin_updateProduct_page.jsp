<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
		<form id="admin_productUpdate_form" name="admin_productUpdate_form"  method="post" enctype="multipart/form-data" >
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>修改商品</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input type="hidden" name="pid" value="<s:property value='model.pid'/>">
						<input type="hidden" name="image" value="<s:property value='model.image'/>">
						<input type="text" name="pname" id="adminproduct_update_do_pname" value="<s:property value='model.pname'/>" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						二级分类名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
					<select id="adminproduct_update_do_csid" name="categorySecond.csid">
						<s:iterator var='categorySecond' value='categorySecondList' >
							<option  <s:if test="#categorySecond.csid==model.categorySecond.csid">selected</s:if> value="<s:property value='#categorySecond.csid' />"><s:property value='#categorySecond.csname' /></option>
						</s:iterator>
					</select>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						市场价：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
						<input value="<s:property value='model.market_price'/>" type="text" name="market_price" id="adminproduct_update_do_market_price" class="bg"/>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商城价：
					</td>
					<td class="ta_01" bgColor="#ffffff" >
					<input type="text" value="<s:property value='model.shop_price' />" name="shop_price" id="adminproduct_update_do_shop_price" class="bg"/>
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						是否为热门商品：
					</td>
					<td class="ta_01" align="left" bgColor="#afd1f3" height="26">
						<select name="is_hot" id="adminproduct_update_do_is_hot">
							<option value="1" <s:if test="model.is_hot==1">selected</s:if>> 是</option>
							<option value="0" <s:if test="model.is_hot==0">selected</s:if>> 否</option>
						</select>
					</td>
					<td class="ta_01" align="center" bgColor="#afd1f3" height="26">商品图片</td>
					<td class="ta_01" align="left" bgColor="#afd1f3" height="26">
						<input type="file" name="upload">
					</td>
				</tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						商品描述：
					</td>
					<td class="ta_01" align="left" bgColor="#afd1f3" colSpan="3" height="26">
						<textarea rows="6" cols="40" name="pdesc"  id="adminproduct_update_do_pdesc"> <s:property value="model.pdesc"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
						<button type="button" id="adminproduct_update_do_submit" value="确定" class="button_ok" onclick="adminproduct_update_do()" >
							&#30830;&#23450;
						</button>
						
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
						<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
</form>