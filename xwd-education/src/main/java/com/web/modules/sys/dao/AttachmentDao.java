package com.web.modules.sys.dao;

import com.web.commons.dao.BaseDao;
import com.web.modules.sys.entity.Attachment;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author nanxiaoqiang
 * 
 */
@Repository
public class AttachmentDao extends BaseDao<Attachment> {
	public int deleteById(Long id) {
		return this.updateDelFlag(id, Attachment.DEL_FLAG_DELETE);
	}

}