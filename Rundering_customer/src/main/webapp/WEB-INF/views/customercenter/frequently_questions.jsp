<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>자주 묻는 질문(FAQ)</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">FAQ</li>
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    
    <section class="content">
        <div class="row">
            <div class="col-12" id="accordion">
                
                <div class="card card-primary card-outline">
                    <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseOne" expanded="false">
                        <div class="card-header">
                            <h4 class="card-title w-100">1. 세탁을 맡기면 모두 본사에서 하나요?</h4>
                        </div>
                    </a>
                    <div id="collapseOne" class="collapse" data-parent="#accordion">
                        <div class="card-body">현재 대전 전 지역 서비스 대상 지역이며, 구 기준으로 접수된
                            세탁물을 수거하여 세탁 후 배송하는 순서로 이루어집니다.</div>
                        </div>
                    </div>
                    
                    <div class="card card-primary card-outline">
                        <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseTwo" expanded="false">
                            <div class="card-header">
                                <h4 class="card-title w-100">2. 세탁을 맡기면 전부 드라이크리닝을 해주나요?</h4>
                            </div>
                        </a>
                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                            <div class="card-body">드라이크리닝이냐? 물세탁이냐?는 옷의 소재나, 가공상태, 오염 정도,
                                케어 라벨 등에 따라 지점에서 의류에 맞게 결정하게 됩니다. 만약, 고객님께서 꼭 드라이크리닝을 원하실 경우에는
                                세탁물을 접수하실 때 별도로 ‘드라이클리닝 요청서’를 작성해 주셔야 합니다.</div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseThree" expanded="false">
                                <div class="card-header">
                                    <h4 class="card-title w-100">3. 의류 수선도 하나요?</h4>
                                </div>
                            </a>
                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                <div class="card-body">현재 저희 업체에서는 의류 수선을 하고 있지 않습니다.</div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseFour" expanded="false">
                                <div class="card-header">
                                    <h4 class="card-title w-100">4. 세탁은 도착까지 얼마나 걸리나요??</h4>
                                </div>
                            </a>
                            <div id="collapseFour" class="collapse" data-parent="#accordion">
                                <div class="card-body">영업일 기준으로 1박 2일 또는 2박 3일의 기간이 소요됩니다. 그러나, 세탁물이 한꺼번에 몰리는 4,5월 경우에는 기간이 다소 더 소여될 수 있습니다.</div>
                            </div>
                        </div>
                        <div class="card card-primary card-outline">
                            <a class="d-block w-100 collapsed" data-toggle="collapse" href="#collapseFive" expanded="false">
                                <div class="card-header">
                                    <h4 class="card-title w-100">5. 이용하던 지점이 폐점된 경우에는 어떻게 되나요?</h4>
                                </div>
                            </a>
                            <div id="collapseFive" class="collapse" data-parent="#accordion">
                                <div class="card-body">현재 저희 업체는 초기 운영이므로 향후 3년이상은 폐점 될 상황이 없는 상태입니다.</div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-3 text-center">
                        <p class="lead">
                            <a href="<%=request.getContextPath()%>/customercenter/question/board.do">Contact us</a>,
                            if you found not the right anwser or you have a other question?<br />
                        </p>
                    </div>
                </div>
                
            </section>
