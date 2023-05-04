<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Корзина</h1>
    <hr>
    <br>
    <section class="h-100 bg-dark">
        <div class="container h-100 py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-10">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="fw-normal mb-0 text-white">Что-нибудь ещё?</h2>
                    </div>
                    <#list products as product>
                        <div class="card rounded-3 mb-4">
                            <div class="card-body p-4">
                                <div class="row d-flex justify-content-between align-items-center">
                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                        <img
                                                src="/images/${product.previewImageId}"
                                                class="img-fluid rounded-3" alt="Упс">
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <p class="lead fw-normal mb-2">${product.title}</p>
                                        <p><span class="text-muted">Вес/объем: </span>${product.id}</p>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                        <button class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <input id="form1" min="1" name="quantity" value="1" type="number"
                                               class="form-control form-control-sm" />

                                        <button class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <h5 class="mb-0">${product.price}</h5>
                                    </div>
                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                        <form action="/cart/remove" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" style="border: none; background: transparent; color: brown" >
                                                <i class="fas fa-trash fa-lg"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>

                    <div class="card bg-dark">
<#--                        <div class="card-body bg-dark">-->
                            <form action="/cart/add" method="post">
<#--                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--                                <input type="hidden" name="productId" value="${product.id}">-->
                                <button type="submit" class="btn btn-success btn-block btn-lg">
                                    Сделать заказ
                                </button>
                            </form>
<#--                            <button type="button" class="btn btn-success btn-block btn-lg">Сделать заказ</button>-->
<#--                        </div>-->
                    </div>

                </div>
            </div>
        </div>
    </section>
</@t.template>