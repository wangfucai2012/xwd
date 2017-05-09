/*javascript for Bubble Tooltips by njmetro ICT
*
* 根据南京地铁的要求很好的改造
- http://www.nj-dt.com */

function enableTooltips(id)
{
	var links,i,h;
	if(!document.getElementById || !document.getElementsByTagName) 
		return;
	AddCss();
	if(document.getElementById("bubbletips"))
	{
		document.getElementsByTagName("body")[0].removeChild(document.getElementById("bubbletips"));
	}
	h=document.createElement("span");
	h.id="bubbletips";
	h.setAttribute("id","bubbletips");
	h.style.position="absolute";
	document.getElementsByTagName("body")[0].appendChild(h);
	if(id==null)
	{ 
		links=document.getElementsByTagName("a");
	}
	else 
	{
		links=document.getElementById(id).getElementsByTagName("a");
	}
	
	for(i=0;i<links.length;i++)
	{
		// 如果title为空，则不冒泡
        if(links[i].getAttribute("title")!=null &&
        	links[i].getAttribute("title").length>0)
        {
        	Prepare(links[i]);
        }
	}
}

/**
* 基本的方法是把需要冒泡的用同一个名称,需要更新之后重新调用此方法后,就可以动态更新
* 冒泡的提示了. 
* 传入的参数一个是 className  另外一个是 tagName
* 可以实现动态更新冒泡提示
* */
function enableTooltipsByName(clsName,tagName)
{
	var links,i,h,ele;
	if(!document.getElementById || !document.getElementsByTagName)
		return;
	AddCss();
	if(document.getElementById("bubbletips"))
	{
		document.getElementsByTagName("body")[0].removeChild(document.getElementById("bubbletips"));
	}
	h=document.createElement("span");
	h.id="bubbletips";
	h.setAttribute("id","bubbletips");
	h.style.position="absolute";
	document.getElementsByTagName("body")[0].appendChild(h);
	if(tagName!=null)
		links=document.getElementsByTagName(tagName);
    //alert(links.length);
    var arr = new Array();
    for(var j=0;ele = links[j];j++)
    {
       if(ele.className!=undefined && 
       	ele.className!=null && 
       	ele.className==clsName)
       	arr[j]=ele;
    }
    //alert(arr.length);
    for(i=0;i<arr.length;i++)
	{
        //alert("=====");
        if(arr[i]!=null)
        	Prepare(arr[i]);
	}
	
}


function Prepare(el)
{
	var tooltip,t,b,s,l;
	t=el.getAttribute("title");
	if(t==null || t.length==0) 
		t="链接:";
	el.removeAttribute("title");
	tooltip=CreateEl("span","tooltip");
	s=CreateEl("span","top");
	s.appendChild(document.createTextNode(t));
	tooltip.appendChild(s);
	b=CreateEl("b","bottom");
	//l=el.getAttribute("href");
	//if(l.length>30) 
	//	l=l.substr(0,27)+"...";
	//b.appendChild(document.createTextNode(l));
	tooltip.appendChild(b);
	setOpacity(tooltip);
	el.tooltip=tooltip;
	el.onmouseover=showTooltip;
	el.onmouseout=hideTooltip;
	el.onmousemove=Locate;
}

function showTooltip(e)
{
	document.getElementById("bubbletips").appendChild(this.tooltip);
	Locate(e);
}

function hideTooltip(e)
{
	var d=document.getElementById("bubbletips");
	if(d.childNodes.length>0) d.removeChild(d.firstChild);
}

function setOpacity(el)
{
	el.style.filter="alpha(opacity:95)";
	el.style.KHTMLOpacity="0.95";
	el.style.MozOpacity="0.95";
	el.style.opacity="0.95";
}

function CreateEl(t,c)
{
	var x=document.createElement(t);
	x.className=c;
	x.style.display="block";
	return(x);
}

function AddCss()
{
	var l=CreateEl("link");
	l.setAttribute("type","text/css");
	l.setAttribute("rel","stylesheet");
	l.setAttribute("href","./js/bt.css");
	l.setAttribute("media","screen");
	document.getElementsByTagName("head")[0].appendChild(l);
}

function Locate(e)
{
	var posx=0,posy=0;
	if(e==null) e=window.event;
	if(e.pageX || e.pageY)
	{
	    posx=e.pageX; posy=e.pageY;
	}
	else if(e.clientX || e.clientY)
	{
	    if(document.documentElement.scrollTop)
	    {
	        posx=e.clientX+document.documentElement.scrollLeft;
	        posy=e.clientY+document.documentElement.scrollTop;
	    }
	    else
	    {
	        posx=e.clientX+document.body.scrollLeft;
	        posy=e.clientY+document.body.scrollTop;
	    }
	}
	document.getElementById("bubbletips").style.top=(posy+10)+"px";
	document.getElementById("bubbletips").style.left=(posx-20)+"px";
}