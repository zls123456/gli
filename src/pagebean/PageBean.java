package pagebean;

import java.util.List;

/**
 *  ��ҳ����
 * @author Administrator
 * oracle:��ҳ���
 *	select a.* (select ��.*,rowum rn from ��) a where rn>(pageNo-1)*pageSize and rn <=pageNo*pageSize;
 */
public class PageBean<T> {

    private int pageNo = 1;  //��ǰҳ
    private int pageSize = 4; //ÿҳ����
    private int totalCount;  //�ܼ�¼��
    private int totalPages;  //��ҳ��--ֻ��
    private List<T> pageList;  //ÿҳ��Ӧ�ļ��Ϸ���
    public int getPageNo() {
        return pageNo;
    }
    //��ǰҳ�벻��С��1���ܴ�����ҳ��
    public void setPageNo(int pageNo) {
        if(pageNo<1)
            this.pageNo = 1;
        else if(pageNo > totalPages)
            this.pageNo = totalPages;
        else
            this.pageNo = pageNo;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    //�ܼ�¼��������ҳ��
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.totalPages = (this.totalCount%this.pageSize==0)?this.totalCount/this.pageSize:this.totalCount/this.pageSize+1;
    }
    public int getTotalCount() {
        return totalCount;
    }
    
    //ֻ��
    public int getTotalPages() {
        return totalPages;
    }
    
    
    public List<T> getPageList() {
        return pageList;
    }
    public void setPageList(List<T> pageList) {
        this.pageList = pageList;
    }
    public PageBean(int pageNo, int pageSize, int totalCount, int totalPages,
            List<T> pageList) {
        super();
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPages = totalPages;
        this.pageList = pageList;
    }
    public PageBean() {
        super();
        // TODO Auto-generated constructor stub
    }
 }
