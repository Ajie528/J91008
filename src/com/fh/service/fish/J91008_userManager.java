package com.fh.service.fish;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 用户管理接口
 * 创建人：Ajie
 * 创建时间：2019-10-14
 * @version
 */
public interface J91008_userManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;

	/**清空表数据保留顶点账号
	 * @param pd
	 * @throws Exception
	 */
	void wipeData(PageData pd)throws Exception;

	/**重置序列
	 * @param pd
	 * @throws Exception
	 */
	void reset_seq(PageData pd)throws Exception;

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	/**更新推荐人数
	 * @param pd
	 * @throws Exception
	 */
	void addReNumber(PageData pd)throws Exception;

	/**重置喂养次数和提现次数
	 * @param pd
	 * @throws Exception
	 */
	void resetRec(PageData pd)throws Exception;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**验证手机号和密码是否匹配
	 * @param pd
	 * @throws Exception
	 */
	PageData findByPhoneAndpassword(PageData pd)throws Exception;

	/**通过手机号获取数据
	 * @param pd
	 * @throws Exception
	 */
	PageData findByPhone(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

