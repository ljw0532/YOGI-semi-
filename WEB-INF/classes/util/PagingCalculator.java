package util;

public class PagingCalculator {
	private int blockCount; // 한페이지에 보여줄 총 리스트 수 , 3
	private int blockPage; // 한화면에 보여줄 페이지 수 , 3

	private int currentPage; // 현재 페이지 , 2
	private int totalCount; // 전체게시물수 , 10
	private int totalPage; // 전체페이지수 , 4 Math.ceil(10/blockPage)

	private int startCount; // 한페이지에 보여줄 게시글 시작번호 , (currentPage*(blockCount-1))
							// = 4
	private int endCount; // 한페이지에 보여줄 게시글 끝 번호 , currentPage*blockCount = 6
	private int startPage; // 시작페이징수 , startPage = currentPage
	private int endPage; // 끝페이징수 , currentPage>=blockPage ? 3 :

	private StringBuffer pagingHtml;

	public PagingCalculator(String action, int currentPage, int totalCount, int blockCount, int blockPage) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.blockCount = blockCount;
		this.blockPage = blockPage;

		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage <= 0) {
			totalPage = 1;
		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		pagingHtml = new StringBuffer();
		if (currentPage > blockPage) {
			pagingHtml.append("<a href=" + action + ".action?currentPage=" + (startPage - 1) + "> < </a>");
		}
		pagingHtml.append("&nbsp;");

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("&nbsp;<b>" + i + "</b>");
			} else {
				pagingHtml.append("&nbsp;");
				pagingHtml.append("<a href=" + action + ".action?currentPage=" + i + ">" + i + "</a>");
			}
			pagingHtml.append("&nbsp;");
		}

		pagingHtml.append("&nbsp;");

		// 다음 블럭 페이지
		if (totalPage - startPage >= blockPage) {
			pagingHtml.append("<a href=" + action + ".action?currentPage=" + (endPage + 1) + "> > </a>");
		}
		
//		System.out.println("paging html : "+pagingHtml.toString());
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}
