<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
   
    <div class="card-body">
        <div class="card-header card-primary card-outline">
        <h3 class="card-title">시설 as 요청</h3>
    </div>
        <div class="tab-pane active " id="settings">
           
            <form class="form-horizontal" action="" method="post">
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">물품</label>
                    <div class=" col-sm-10">
                        <select class="form-control" name="" id="" style="width: 120px; margin-top: 6px;">
                            <option value="세탁기">세탁기</option>
                            <option value="세탁기">세탁기</option>
                        </select>
                        
                    </div>
                </div>
               
                <div class="form-group row">
                    <label for="inputName2" class="col-sm-2 col-form-label">고장원인</label>
                    <div class="col-sm-10">
                        
                        <textarea name="" id="inputName2" cols="30" rows="4" class="form-control" placeholder="고장원인"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputName3" class="col-sm-2 col-form-label">고장내용</label>
                    <div class="col-sm-10">
                        
                        <textarea name="" id="inputName3" cols="30" rows="4" class="form-control" placeholder="고장내용"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputSkills" class="col-sm-2 col-form-label">고장날짜</label>
                    <div class="col-sm-4">
                        <input type="date" class="form-control" id="inputSkills" placeholder="Skills">
                    </div>
                </div>
               
                <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                        <div class="float-right">
                        <button type="submit" class="btn btn-primary">저장</button>
                        <button type="submit" class="btn btn-secondary">취소</button>
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
