<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
    <div class="row">
        <div class="col-12">
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title">세탁현황 수정</h3>
                    <div class="card-tools">

                        <div class="input-group input-group-sm">
                            <select class="form-control col-md-12" name="searchType" id="searchType">

                                <option value="c">세탁전</option>
                                <option value="tc">세탁중</option>
                                <option value="tc">세탁완료</option>

                            </select>



                            <span class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    저장

                                </button>
                            </span>

                        </div>
                    </div>
                </div>

                <div class="card table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th class="width10">주문번호</th>
                                <th class="width10">이름</th>
                                <th class="width15">주소</th>
                                <th class="width40">요청사항</th>
                                <th class="width10">세탁물 상태</th>
                                <th class="width10">배송예정일</th>
                                <th class="width5">선택</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr class="mouseHover">
                                <td>11121</td>
                                <td>백관우</td>
                                <td>대전 유성구 반석동</td>
                                <td class="textCut" data-text="얼룩이 뭍어있어요 깨끗하게 딱아주세요asdasdasdasdasdsadasd"></td>
                                <td>세탁중</td>
                                <td>2일</td>
                                <td><input type="checkbox" name="" id=""></td>

                            </tr>
                            <tr class="mouseHover">
                                <td>11121</td>
                                <td>백관우</td>
                                <td>대전 유성구 반석동</td>
                                <td class="textCut" data-text="얼룩이 뭍어있어요 깨끗하게 딱아주세요asdasdasdasdasdsadasd"></td>
                                <td>세탁중</td>
                                <td>2일</td>
                                <td><input type="checkbox" name="" id=""></td>

                            </tr>
                            <tr class="mouseHover">
                                <td>11121</td>
                                <td>백관우</td>
                                <td>대전 유성구 반석동</td>
                                <td class="textCut" data-text="얼룩이 뭍어있어요 깨끗하게 딱주세요asdasdasdasdsdsadasd"></td>
                                <td>세탁중</td>
                                <td>2일</td>
                                <td><input type="checkbox" name="" id=""></td>

                            </tr>
                            <tr class="mouseHover">
                                <td>11121</td>
                                <td>백관우</td>
                                <td>대전 유성구 반석동</td>
                                <td class="textCut" data-text="얼룩이 뭍어있어요 깨끗하게 세요asdasdasdasdasdsadasd"></td>
                                <td>세탁중</td>
                                <td>2일</td>
                                <td><input type="checkbox" name="" id=""></td>

                            </tr>
                            <tr class="mouseHover">
                                <td>11121</td>
                                <td>백관우</td>
                                <td>대전 유성구 반석동</td>
                                <td class="textCut" data-text="얼룩이 뭍어있어요하게 딱아주세요asdasdasdasdasdsad"></td>
                                <td>세탁중</td>
                                <td>2일</td>
                                <td><input type="checkbox" name="" id=""></td>

                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
    <script>
        let texts= document.querySelectorAll(".textCut");
        
        
        for (let i of texts){
            if(i.dataset.text.length>20){
                i.innerHTML=i.dataset.text.substring(0,20)+"..."
            }else{
                i.innerHTML=i.dataset.text
            }
            
            
        }

    </script>
</body>
