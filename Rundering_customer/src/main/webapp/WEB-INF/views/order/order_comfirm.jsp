<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

 <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>세탁주문 확인</h1>
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

<div class="col-lg-12">
	<div class="col-lg-6 card">
		<div class="card-header">
			<h3 class="card-title">주무내역</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>

		<div class="card-body p-0">
			<ul class="products-list product-list-in-card pl-2 pr-2">
				<li class="item">
					<div class="product-img">
						<img src="dist/img/default-150x150.png" alt="Product Image"
							class="img-size-50">
					</div>
					<div class="product-info">
						<a href="javascript:void(0)" class="product-title">셔츠
							<span class="badge badge-warning float-right">6000원</span>
						</a> <span class="product-description">5개</span>
					</div>
				</li>

				<li class="item">
					<div class="product-img">
						<img src="dist/img/default-150x150.png" alt="Product Image"
							class="img-size-50">
					</div>
					<div class="product-info">
						<a href="javascript:void(0)" class="product-title">극세사이불<span
							class="badge badge-info float-right">45000원</span></a> <span
							class="product-description">3개</span>
					</div>
				</li>

				<li class="item">
					<div class="product-img">
						<img src="dist/img/default-150x150.png" alt="Product Image"
							class="img-size-50">
					</div>
					<div class="product-info">
						<a href="javascript:void(0)" class="product-title">워커<span
							class="badge badge-danger float-right">22000원</span>
						</a> <span class="product-description">2개</span>
					</div>
				</li>

				<li class="item">
					<div class="product-img">
						<img src="dist/img/default-150x150.png" alt="Product Image"
							class="img-size-50">
					</div>
					<div class="product-info">
						<a href="javascript:void(0)" class="product-title">니트<span class="badge badge-success float-right">20000원</span>
						</a> <span class="product-description">5개</span>
					</div>
				</li>

			</ul>
		</div>

		<div class="card-footer text-center">
			<a href="javascript:void(0)" class="uppercase">View All Products</a>
		</div>
	</div>
</div>