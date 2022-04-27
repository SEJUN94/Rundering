<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>세탁물 수거/배송 관리</h1>
                </div>
            </div>
        </div>
    </section>
    <div class="callout callout-info ml-3 mr-3">
        <h5><i class="fas fa-info"></i> 공지:</h5>
        	새로운 공지사항이 없습니다.
    </div>
    <div class="m-3" style="">
        <button type="button" class="btn btn-block btn-outline-info btn-lg" 
        onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickup.do'"
        style="
        font-size: 2rem;
        padding: 2rem 0;
        margin: 2rem 0;
    "><i class="fa fa-bell"></i> 진행중인 수거 4건</button>
        <button type="button" class="btn btn-block btn-outline-success btn-lg" 
        onclick="location.href='<%=request.getContextPath()%>/fordelivery/delivery.do'"
        style="
        font-size: 2rem;
        padding: 2rem 0;
        margin: 2rem 0;
    "><i class="fa fa-bell"></i> 진행중인 배송 15건</button>
    </div>

</body>


