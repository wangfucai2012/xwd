<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>菜单管理</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/treetable.jsp"%>
<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
</head>
<body>
	<div id="dev-help-main">
		<div class="container">
			<h1>
				开发帮助 <span class="label label-default">New</span>
			</h1>
			<h2>Java</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">数据库映射Entity：</h3>
				</div>
				<div class="panel-body">
					<h4>实现方式：</h4>
					<span> 1、除特殊表外全部继承<b>DataEntity</b>，显式声明<b>serialVersionUID</b>。
						如默认的：
					</span>
					<pre><code class="language-java" data-lang="java">private static final long serialVersionUID = 1L;</code></pre>
					<span> 2、特殊表的话<b>implements Serializable</b>，显式声明<b>serialVersionUID</b>。<br />
						3、最好Override一下几个方法：<b>hashCode</b>、<b>equals</b>、<b>toString</b>。
						懒的话可以用<b>Apache commons Lang3</b>包的代替：
					</span>
					<pre><code class="language-java" data-lang="java">@Override
public int hashCode() {
	// 第二个参数可以不填，是不使用的属性名称
	return HashCodeBuilder.reflectionHashCode(this, "remark");
}

@Override
public boolean equals(Object obj) {
	return EqualsBuilder.reflectionEquals(this, obj);
}

@Override
public String toString() {
	return ToStringBuilder.reflectionToString(this,
		ToStringStyle.MULTI_LINE_STYLE);
}</code></pre>
					<span>4、类前加注解<b>@Entity</b>
					</span><br /> <span>5、类前加注解<b>@Table(name = “xxxx”)</b>，表示映射的表的名称。
					</span><br /> <span>PS：最好表名称采用<b>全小写</b>，Oracle表不区分大小写默认自动会专为大写，但是utf_8_bin下的MySQL和SQL
						Server数据库默认是大小写敏感的，所以表和字段最好在建立的时候就都是小写。
					</span><br /> <span>6、类前加注解<b>@DynamicInsert @DynamicUpdate</b>，表示在Insert和Update的时候，Entity类会自动判断修改的属性字段并插入或更新，没有赋值的不会插入或更新。
					</span><br /> <span>7、类前加注解<b>@Cache(usage =
							CacheConcurrencyStrategy.READ_WRITE)</b>，如果是只读表的话可以把最后改为READ_ONLY。
					</span><br /> <span>8、非空类属性在get方法前加注解<b>@NotNull</b>
					</span><br /> <span>9、长度为1的字段可以取巧在get方法前加注解<b>@Length(min = 1,
							max = 1)</b>
					</span><br /> <span>10、有超长的字符串可以在get方法前加注解<b>@Length(min = 0,
							max = 2000)</b>
					</span><br /> <span>11、不想映射到数据库中但是还想用的方法必须加注解<b>@Transient</b>
					</span><br /> <span>12、原有的删除字段的属性是<b>DEL_FLAG</b>，现在改为<b>FIELD_DEL_FLAG</b>。
					</span>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Dao层</h3>
				</div>
				<div class="panel-body">
					<div>原来的接口写法是使用的Spring
						JPA，因为想直接使用类似于findNameLike的接口方法，但是实际上并不好集成而且实际应用中查询比较复杂而且不支持嵌套查询，所以以后还是不使用Spring
						JPA，改为Hibernate的事务。</div>
					<h4>实现方式</h4>
					<span>1、接口实现<b>BaseDao &lt;T&gt;</b></span><br /> <span>
						2、在类之前加注解<b>@Repository</b>（Spring自动扫描bean的时候回将此类注解的bean中出现的数据访问异常统一集成到Spring的数据访问异常中）
					</span><br /> <span> 3、HQL语句的参数要使用”:p1”,”:p2”的方式。</span><br /> <span>
						4、所有的HQL参数放到<b>new Parameter(XXX, XXXX)</b>中去。
					</span><br /> <span>5、调用SQL的方式使用<b>findBySQL(sqlString,
							params...)</b>
					</span><br /> <span>5、方法变化，Hibernate JPA的按照Id查找默认方法名称是get，而原来的
						SpringJPA 的方法是findOne。需要改正。</span>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Service业务逻辑层</h3>
				</div>
				<div class="panel-body">
					<h3>
						这一层是业务逻辑，<b>最好不要放SQL！最好不要放SQL！最好不要放SQL！ ＃重复三遍以示强调＃</b>
					</h3>
					<h4>实现方式</h4>
					<span>1、Service要继承<b>BaseService</b></span><br /> <span>2、类前加注解：<b>@Service</b>
						声明是个Service类型bean
					</span><br /> <span>3、类前加注解：<b>@Transactional(readOnly = true)</b>，意为事务是否可更改数据，这里写为只读，为了安全和Spring的事务管理效率只在可能修改数据方法上（如save和delete）加上注解<b>@Transactional(readOnly
							= false)</b>
					</span><br /> <span>4、自动注入的Dao上加注解<b>@Autowired</b>。
					</span><br /> <span> 5、<del>多数据库事务（待完善！） </del></span>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Controller层（页面前段访问跳转）</h3>
				</div>
				<div class="panel-body">
					<h3>
						Controller除了跳转页面、往页面传参、传数据外<b>不要</b>写任何的业务逻辑！
					</h3>
					<h4>实现方式</h4>
					<span>1、继承<b>BaseController</b></span><br /> <span>2、类前加注解<b>@Controller</b></span><br />
					<span>3、类前加注解<b>@RequestMapping(value = “xxx/xxx/xxx”)</b>，注意value内的字符串前没有”/“。
					</span><br /> <span>4、自动注入的Service上加注解<b>@Autowired</b></span><br /> <span>5、页面采用的是自动装配entity，<b>必须</b>写一个以下方法：
					</span>
					<pre><code class="language-java" data-lang="java">@ModelAttribute(“classT")
public ClassT get(@RequestParam(required = false) String id) { 
	if (StringUtils.isNotBlank(id)) { 
		return classTService.get(id); 
	} else { 
		return new ClassT(); 
	} 
}</code></pre>
					<span>6、Controller中每个方法对应一个url请求，方法前加注解<b>@RequestMapping(value
							= {"list", "”})</b>，value可以是一个(“")或多个({“x”, “xx”})，为空可以是默认值
					</span><br /> <span>7、如果有权限的话方法前加<b>@RequiresPermissions("sys:site:edit”)</b>，字符串为配置好的权限，<del>如果可能可以使用url拦截的方式配置权限（尚未完成）</del></span><br />
					<span>8、如果方法没有权限，但是需要用户登录才可以使用此方法的话，要在方法前加注解<b>@RequiresUser</b></span><br />
					<span>9、页面传值的方式是<b>model.addAttribute("xxx", xxx);</b></span><br />
					<span>10、跳转到页面的方法是 <b>return “xxx/xxx/xxxx”;</b></span><br /> <span>11、跳转到另外一个请求的方法是<b>return
							“redirect:xx/xxx/xxx/list”;</b>前边要加上<b>redirect:</b></span><br /> <span>12、Ajax回调的方法，在方法前加<b>@ResponseBody</b>，方法返回类型就是你想返回的对象，在方法中最好能显式声明response个格式，<br />如：</span>
						<pre><code class="language-java" data-lang="java">response.setContentType("application/json; charset=UTF-8");</code></pre><span>返回字符串的话是<b>text/html</b>。
					</span><br /> <span>13、可以将从页面传递来的参数显式写到方法中，使用方法为<b>@RequestParam(value="number",
							required=false) String num</b>，表示页面提交的String类型的number参数，在方法中的名称是num。
					</span><br /> <span>14、Restful方式url，如链接为/sys/menu/view/1，意思为查看id为1的数据，<br />方法应当如下
					</span>
					<pre><code class="language-java" data-lang="java">@RequestMapping("view/{id}")
public String view(@PathVariable("id") Long id)</code></pre>
					<span>15、…… </span>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Rest服务</h3>
				</div>
				<div class="panel-body">
					<h4>实现方式</h4>
					<span>1、继承<b>BaseController</b></span><br /> <span>2、类前加注解<b>@RestController</b></span><br />
					<span>3、类前加注解<b>@RequestMapping(value = “xxx/xxx/xxx”)</b>，注意value内的字符串前没有“/”。
					</span><br /> <span>……</span>
				</div>
			</div>
			<h2>页面开发</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">页面</h3>
				</div>
				<div class="panel-body">
				<h4>表格样式</h4>
				<dl>
					<dt>table-striped table-bordered table-hover table-condensed</dt>
					<dd>分别为：隔行颜色不同，带外边框，鼠标指上该行变色，紧凑表格(最后一个不推荐)</dd>
				</dl>
				<h4>分页</h4>
				<span>只有需要分页的页面需要加的脚本</span>
				<pre><code class="language-html" data-lang="html">function page(n,s){
	$("#pageNo").val(n);
	$("#pageSize").val(s);
	$("#searchForm").submit();
	return false;
}</code></pre>
				<h4>更改的标签页</h4>
				<span>原来以<strong> tags </strong>开头的标签页如<code>&lt;tags:message&gt;</code>现在全部切换为<strong> sys </strong>开头的<code>&lt;sys:message&gt;</code></span>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">jQuery</h3>
				</div>
				<div class="panel-body">
					<h4>jQuery-Validator</h4>
					<h4>jQuery UI</h4>
					<h4>jQuery easyUI</h4>
					<h4>jquery-ztree</h4>
					待添加……
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Bootstrap 3</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>配置文件</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">待添加……</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>SSL加密连接</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Tomcat和工程的https支持</h3>
				</div>
				<div class="panel-body">
					<span>需要在本机生成key并加入到tomcat配置中，<br />
					<br />具体自行百度╮(￣▽￣")╭ <br />
					<br /> 如果要在工程中禁止SSL，在配置文件的<b>security/applicationContext-shiro.xml</b>中，将23行的"
						, ssl"去掉(<b>逗号","也要删掉</b>)
					</span>
				</div>
			</div>
			<h2>数据库连接监控</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Alibaba Druid</h3>
				</div>
				<div class="panel-body">
					<span>使用的是阿里巴巴的Druid数据库连接池<br /> 在web.xml中配置监控界面的链接和访问控制<br />
						当前工程只支持本机 <b>127.0.0.1</b>，<br />
					<a href="${ctx}/druid">访问地址</a></span>
				</div>
			</div>
			<h2>日志拦截器</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">待添加……</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>缓存</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Hibernate的缓存EhCache</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Redis</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Memcached</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>定时任务</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">JDK Timer</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Spring Cron</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Spring Task Scheduler XML</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Quartz任务</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>消息队列</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">ActiveMQ</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">RabbitMQ</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>Socket通讯</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">WebSocket</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">HttpClient</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Netty?</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>工作流集成</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Activitii BPM</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>数据库</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Oracle</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">MySQL</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<h2>ArcGIS</h2>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">SDE</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Javascript API</h3>
				</div>
				<div class="panel-body">待添加……</div>
			</div>
		</div>
	</div>
</body>
</html>