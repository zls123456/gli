package page;

import javax.servlet.http.HttpServletRequest;

public class Pager {

	/**
	 * ���ɼ򵥵ķ�ҳҳ������
	 * 
	 * @param total
	 *            �ܼ�¼��
	 * @param size
	 *            ÿҳ��¼��
	 * @param step
	 *            �����ʾ��ҳҳ��
	 * @param page
	 *            ��ǰҳ��
	 * @param request
	 *            ����request
	 * @return ��ҳ��HTML����
	 */
	public static String getSimplePages(int total, int size, int step,
			int page, HttpServletRequest request, String paramName) {
		// ����request��ȡ��ǰurl������������������Ѵ�������δparamname�Ĳ������޳����������׷���µĲ���
		String url = request.getContextPath() + request.getServletPath();
		String query = request.getQueryString();
		if (query != null) {
			String params = "";
			String[] querys = query.split("&");
			for (int i = 0; i < querys.length; i++) {
				if (querys[i].startsWith(paramName))
					continue;
				if (params.equals(""))
					params += querys[i];
				else
					params += "&" + querys[i];
			}
			if (!params.equals(""))
				url += "?" + params;
		}
		// ���html
		String pages = "";

		int pageCount = (int) Math.ceil((double) total / size);// ����ҳ��
		if (pageCount == 1) {
			return pages;
		}
		if (page > pageCount) {
			page = pageCount;// �����ҳ��������ҳ�����򽫷�ҳ�������Ϊ��ҳ��
		}
		if (page <= 0) {
			page = 1;// �����ҳ����С�ڣ�,�򽫷�ҳ������Ϊ��
		}

		// ��ʾ��һҳ
		if (page > 1) {
			if (url.contains("?")) {
				pages = pages.concat("<a class=\"prev\" href=\"" + url + "&"
						+ paramName + "=" + (page - 1) + "\">��һҳ</a>\n");
			} else {
				pages = pages.concat("<a class=\"prev\" href=\"" + url + "?"
						+ paramName + "=" + (page - 1) + "\">��һҳ</a>\n");
			}
		} else {
			pages = pages
					.concat("<a class=\"prev\" href=\"javascript:;\" style=\"color:#ccc\">��һҳ</a>\n");
		}
		// ��ʾ��ҳ��
		int listBegin = (page - (int) Math.floor((double) step / 2));// �ӵڼ�ҳ��ʼ��ʾ��ҳ��Ϣ
		if (listBegin < 1) {
			listBegin = 1;
		}
		// ��ʾ��1ҳ
		if (listBegin >= 2) {
			if (url.contains("?")) {
				pages = pages.concat("<a href=\"" + url + "&" + paramName
						+ "=1\">1</a> ... \n");
			} else {
				pages = pages.concat("<a href=\"" + url + "?" + paramName
						+ "=1\">1</a> ... \n");
			}
		}
		// ��ǰҳ���Ҳ໹��δ��ʾҳ��ʱ
		if (pageCount - page >= page - listBegin) {
			for (int i = listBegin; i < (listBegin + step); i++) {
				if (i != page) {
					if (url.contains("?")) {
						pages = pages.concat("<a href=\"" + url + "&"
								+ paramName + "=" + i + "\">" + i + "</a>\n");
					} else {
						pages = pages.concat("<a href=\"" + url + "?"
								+ paramName + "=" + i + "\">" + i + "</a>\n");
					}
				} else {
					pages = pages.concat("<span class=\"current\">" + i
							+ "</span>\n");
				}
			}
			// ��ʾ���1ҳ
			if (listBegin + step <= pageCount) {
				if (url.contains("?")) {
					pages = pages.concat(" ... <a href=\"" + url + "&"
							+ paramName + "=" + pageCount + "\">" + pageCount
							+ "</a>\n");
				} else {
					pages = pages.concat(" ... <a href=\"" + url + "?"
							+ paramName + "=" + pageCount + "\">" + pageCount
							+ "</a>\n");
				}
			}
		} else { // ��ʾ���ʣ��ļ���ҳ��
			for (int i = (pageCount - step) + 1; i <= pageCount; i++) {
				if (i != page) {
					if (url.contains("?")) {
						pages = pages.concat("<a href=\"" + url + "&"
								+ paramName + "=" + i + "\">" + i + "</a>\n");
					} else {
						pages = pages.concat("<a href=\"" + url + "?"
								+ paramName + "=" + i + "\">" + i + "</a>\n");
					}
				} else {
					pages = pages.concat("<span class=\"current\">" + i
							+ "</span>\n");
				}
			}
		}
		// ��ʾ��һҳ
		if (page < pageCount) {
			if (url.contains("?")) {
				pages = pages.concat("<a class=\"next\" href=\"" + url + "&"
						+ paramName + "=" + (page + 1) + "\">��һҳ</a>\n");
			} else {
				pages = pages.concat("<a class=\"next\" href=\"" + url + "?"
						+ paramName + "=" + (page + 1) + "\">��һҳ</a>\n");
			}
		} else {
			pages = pages
					.concat("<a class=\"next\" href=\"javascript:;\" style=\"color:#ccc\">��һҳ</a>\n");
		}
		return pages;
	}
}
