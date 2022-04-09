<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세탁 접수</title>

</head>
<body>

 <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>세탁주문</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">세탁주문</li>
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

	 <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">정보 확인</h3>
        </div>

        <div class="card-body col-6" style="margin:auto;">
            <div class="form-group">
                <label for="tel">연락처</label>
                <div class="input-group col-sm-8" style="padding-top:20px;">
                	<div class="input-group col-sm-3">
                		<input type="tel" class="form-control" id="tel1" pattern="[0-9-]+" placeholder="010" value="">
                	</div>
                	<div class="input-group col-sm-3">
                		<input type="tel" class="form-control" id="tel1" pattern="[0-9-]+" placeholder="1234" value="">
                	</div>
                	<div class="input-group col-sm-3" style="padding-right:0;">
                		<input type="tel" class="form-control" id="tel1" pattern="[0-9-]+" placeholder="5678" value="">
                	</div>
                		<div class="input-group-append">
							<button type="button" id="modalBtn" class="btn btn-info btn-sm">발급</button>
						</div>
				</div>            
            </div>
            <div class="form-group">
                <label for="addr">인증번호</label>
                <div class="input-group mb-3 col-sm-6" style="padding-top:20px;">
                	<input type="text" class="form-control" id="addr" placeholder="인증번호">
                	<button type="submit" style="margin-top:10px;" class="btn btn-primary btn-block" onclick="location.href='<%=request.getContextPath()%>/order/detail.do'">인증하기</button>
                </div>
            </div>
        </div>


        <div class="card-footer">
            <button type="submit" class="btn btn-primary btn-block" onclick="location.href='<%=request.getContextPath()%>/order/detail.do'">인증하기</button>
        </div>
    </div>


</body>
</html>