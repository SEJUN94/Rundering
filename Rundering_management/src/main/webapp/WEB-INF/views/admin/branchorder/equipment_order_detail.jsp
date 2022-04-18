<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주내역 상세</title>
</head>
<body>
	<div class="col-12 p-0">

    <div class="p-3 m-0">
        <div class="row">
            <div class="col-12">
                <h4>
                    <i class="fas fa-globe"></i> 지점명 <span class="badge bg-secondary">승인 대기</span>
                    <small class="float-right">2022-03-29 / 발주번호: ${itemOrderDetail.seq }</small>
                </h4>
            </div>

        </div>
        <div class="row no-print p-2">
            <div class="col-12">
                <a href="#" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i>
                    Print</a>
                <button type="button" class="btn bg-gradient-secondary float-right" disabled="disabled"
                    style="margin-right: 5px;">배송</button>
                <button type="button" class="btn bg-gradient-secondary float-right" disabled="disabled"
                    style="margin-right: 5px;">발주
                </button>
                <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                    승인
                </button>
                <button type="button" class="btn btn-danger float-right" style="margin-right: 5px;">
                    반려
                </button>


            </div>
        </div>
        <div class="row">
            <div class="col-12 table-responsive p-0">
                <table class="table table-striped m-0 card-secondary card-outline">
                    <thead>
                        <tr>
                            <th colspan="4">총 결제금액 : 90,000원</th>
                        </tr>
                        <tr>
                            <th>제품명</th>
                            <th>개수</th>
                            <th>제품번호</th>
                            <th>가격</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>울전용 세제</td>
                            <td>3</td>
                            <td>455-981-221</td>
                            <td>40,000</td>
                        </tr>
                        <tr>
                            <td>얼룩제거제</td>
                            <td>1</td>
                            <td>247-925-726</td>
                            <td>20,000</td>
                        </tr>
                        <tr>
                            <td>일반 세제</td>
                            <td>1</td>
                            <td>735-845-642</td>
                            <td>10,000</td>
                        </tr>
                        <tr>
                            <td>보풀제거기</td>
                            <td>1</td>
                            <td>422-568-642</td>
                            <td>20,000</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>