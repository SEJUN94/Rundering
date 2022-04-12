<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
<div class="col-md-12">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">공지사항</h3>
            </div>
            <div class="card-body p-0">
                <div class="mailbox-read-info">
                    <h5>Message Subject Is Placed Here</h5>
                    
                </div>
                <div class="mailbox-read-message">
                    <p>Hello John,</p>


                </div>
            </div>
            <div class="card-footer bg-white">
                <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                    <li>
                        <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>
                        <div class="mailbox-attachment-info">
                            <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i>
                                Sep2014-report.pdf</a>
                            <span class="mailbox-attachment-size clearfix mt-1">
                                <span>1,245 KB</span>
                                <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                            </span>
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="card-footer">
                <div class="float-right">
                    <button type="button" class="btn btn-primary">뒤로가기</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg">
                        댓글작성
                        </button>
                    
                    
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modal-lg" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Large Modal</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>One fine body…</p>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
    
        </div>
    
    </div>

</body>