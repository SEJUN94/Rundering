<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
  
<style>
    .circle {
        width: 75px;
        height: 75px;
        border: 15px solid #82BBD8;
        border-radius: 50%;
        margin-right:200px;
    }
    .stepper-wrapper {
     margin-top: auto;
     display: flex;
     justify-content: space-between;
     margin-bottom: 20px;
   }
   .stepper-item {
     position: relative;
     display: flex;
     flex-direction: column;
     align-items: center;
     flex: 1;
   
     @media (max-width: 768px) {
       font-size: 12px;
     }
   }
   
   .stepper-item::before {
     position: absolute;
     content: "";
     border-bottom: 2px solid #ccc;
     width: 100%;
     top: 20px;
     left: -50%;
     z-index: 2;
   }
   
   .stepper-item::after {
     position: absolute;
     content: "";
     border-bottom: 2px solid #ccc;
     width: 100%;
     top: 20px;
     left: 50%;
     z-index: 2;
   }
   
   .stepper-item .step-counter {
     position: relative;
     z-index: 5;
     display: flex;
     justify-content: center;
     align-items: center;
     width: 40px;
     height: 40px;
     border-radius: 50%;
     background: #ccc;
     margin-bottom: 6px;
   }
   
   .stepper-item.active {
     font-weight: bold;
   }
   
   .stepper-item.completed .step-counter {
     background-color: #26ff7b;
     color : white;
   }
   
   .stepper-item.completed::after {
     position: absolute;
     content: "";
     border-bottom: 2px solid #26ff7b;
     width: 100%;
     top: 20px;
     left: 50%;
     z-index: 3;
   }
   
   .stepper-item:first-child::before {
     content: none;
   }
   .stepper-item:last-child::after {
     content: none;
   }
</style>

   	<div class="col-12" style="padding-top:30px;">
   		<div class="card">
   			<div class="card-body mt-3 ml-3 p-0" style="font-size:1.5em;">배송조회</div>
   			<hr>
			<div class="row">
				<div class="col-sm-12" style="padding-top: 10px;">
				      <div class="stepper-wrapper">
				        <div class="stepper-item completed">
				          <div class="step-counter">
				             <i class="fa-solid fa-1"></i>
				          </div>
				          <div class="step-name">수거대기</div>
				        </div>
				        <div id="" class="stepper-item second">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">수거중</div>
				        </div>
				        <div id="" class="stepper-item third">
				          <div class="step-counter">
				             <i class="fa-solid fa-3"></i>
				          </div>
				          <div class="step-name">수거완료</div>
				        </div>
				        <div id="" class="stepper-item fourth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁대기</div>
				        </div>
				        <div id="" class="stepper-item fifth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁중</div>
				        </div>
				        <div id="" class="stepper-item sixth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">세탁완료</div>
				        </div>
				        <div id="" class="stepper-item seventh">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">배송중</div>
				        </div>
				        <div id="" class="stepper-item eighth">
				          <div class="step-counter">
				             <i class="fa-solid fa-2"></i>
				          </div>
				          <div class="step-name">배송완료</div>
				        </div>
				      </div>
				  </div>
			</div>
   		</div>
   	</div>
    <div class="col-12" style=" width: 100%;min-height:700px;max-height:600px; margin: 10px auto; display: flex;">

        <div class="card-body col-6 ml-1" style="min-height:600px;max-height:600px; flex:1;width:50%;box-sizing: border-box; padding-top:1px;">
            <div class="card">
                <div class="card-header info-box m-0">
                    
                        <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">주문 상세 내역</span>
                </div>
                </div>

                <div class="card-body p-0">
                    <ul class="products-list product-list-in-card pl-2 pr-2" style="height:552px;">
                      
                        <li class="item">
                            <div class="product-info">
                                <a href="javascript:void(0)" class="product-title">Samsung TV
                                    <span class="badge badge-warning float-right">$1800</span></a>
                                <span class="product-description">
                                    Samsung 32" 1080p 60Hz LED Smart HDTV.
                                </span>
                            </div>
                        </li>

                        <li class="item">
                            <div class="product-info">
                                <a href="javascript:void(0)" class="product-title">Bicycle
                                    <span class="badge badge-info float-right">$700</span></a>
                                <span class="product-description">
                                    26" Mongoose Dolomite Men's 7-speed, Navy Blue.
                                </span>
                            </div>
                        </li>

                        <li class="item">
                            <div class="product-info">
                                <a href="javascript:void(0)" class="product-title">
                                    Xbox One <span class="badge badge-danger float-right">
                                        $350
                                    </span>
                                </a>
                                <span class="product-description">
                                    Xbox One Console Bundle with Halo Master Chief Collection.
                                </span>
                            </div>
                        </li>

                        <li class="item">
                            <div class="product-info">
                                <a href="javascript:void(0)" class="product-title">PlayStation 4
                                    <span class="badge badge-success float-right">$399</span></a>
                                <span class="product-description">
                                    PlayStation 4 500GB Console (PS4)
                                </span>
                            </div>
                        </li>

                    </ul>
                </div>

                <div class="card-footer clearfix">
                	총 가격 : 
                </div>

            </div>
        </div>
        <div class="col-6" style="min-height: 600px; max-height:600px; flex:1;width:50%;box-sizing: border-box;">
            <div class="card card-primary card-outline direct-chat direct-chat-primary col-12 p-0"
                style="box-sizing: border-box;">
                <div class="card-header">
                    <h3 class="card-title">Direct Chat</h3>
                </div>

                <div class="card-body">

                    <div class="direct-chat-messages">

                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left">고객</span>
                                <span class="direct-chat-timestamp float-right">23 Jan 2:00 pm</span>
                            </div>

                            <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="No img">

                            <div class="direct-chat-text">
                                옷 깨끗하게 빨아놔라!
                            </div>

                        </div>


                        <div class="direct-chat-msg right">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-right">Rundering</span>
                                <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                            </div>

                            <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="No img">

                            <div class="direct-chat-text">
                                신속 깨끗하게 처리해서 집 앞까지 확실히 가져다 드리겠습니다!
                            </div>

                        </div>

                    </div>
                    <div class="direct-chat-contacts">
                        <ul class="contacts-list">
                            <li>
                                <a href="#">
                                    <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg"
                                        alt="User Avatar">
                                    <div class="contacts-list-info">
                                        <span class="contacts-list-name">
                                            Count Dracula
                                            <small class="contacts-list-date float-right">2/28/2015</small>
                                        </span>
                                        <span class="contacts-list-msg">How have you been? I was...</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="card-footer">
                    <form action="#" method="post">
                        <div class="input-group">
                            <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                            <span class="input-group-append">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-12 p-0" style="box-sizing: border-box;">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">사진</h3>
                    </div>

                    <div class="card-body p-0">
                        <ul class="users-list clearfix" style="height:250px;">
                            <li>
                                <img src="dist/img/user1-128x128.jpg" alt="사진넣을곳">
                                <a class="users-list-name" href="#">사진</a>
                                <span class="users-list-date">Today</span>
                            </li>
                           
                        </ul>

                    </div>
                </div>

            </div>
        </div>
    </div>
    
