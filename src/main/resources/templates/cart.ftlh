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
                    <#list carts as cart>
                        <#if cart.active == true>
                        <div class="card rounded-3 mb-4">
                            <div class="card-body p-4">
                                <div class="row d-flex justify-content-between align-items-center">
                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                        <img
                                                src="/images/${cart.product.previewImageId}"
                                                class="img-fluid rounded-3" alt="Упс">
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                        <p class="lead fw-normal mb-2">${cart.product.title}</p>
                                        <p><span class="text-muted">Вес/объем: </span>${cart.weight}</p>
                                    </div>
                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                        <button class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                            <i class="fas fa-minus"></i>
                                        </button>

                                        <input id="form1" min="1" name="quantity" value="${cart.count}" type="number"
                                               class="form-control form-control-sm" />

                                        <button class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <h5 class="mb-0">${cart.product.price} ₽</h5>
                                    </div>
                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                        <form action="/cart/remove" method="post">
                                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                            <input type="hidden" name="productId" value="${cart.product.id}">
                                            <button type="submit" style="border: none; background: transparent; color: brown" >
                                                <i class="fas fa-trash fa-lg"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </#if>
                    </#list>
                    <form action="/order/create" method="post">
                    <section class="pb-5 bg-dark">
                        <div class="row d-flex justify-content-center">
                            <div class="col">
                                <div class="card rounded-3">
                                    <div class="card-body p-4">
                                        <div class="text-center mb-4">
                                            <h3>Данные</h3>
                                            <h6>Оплата</h6>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" id="formControlLgXsd" class="form-control form-control-lg"/>
                                            <label class="form-label" for="formControlLgXsd">Имя</label>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-7">
                                                <div class="form-outline">
                                                    <input type="text" id="formControlLgXM" class="form-control form-control-lg"/>
                                                    <label class="form-label" for="formControlLgXM">Номер карты</label>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-outline">
                                                    <input type="text" id="formControlLgExpk" class="form-control form-control-lg"
                                                           placeholder="ММ/ГГ" />
                                                    <label class="form-label" for="formControlLgExpk">Срок действия</label>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="form-outline">
                                                    <input type="password" id="formControlLgcvv" class="form-control form-control-lg"
                                                           placeholder="***" />
                                                    <label class="form-label" for="formControlLgcvv">Cvv</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center mb-4">
                                            <h6>Доставка</h6>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="text" id="formControlLgXsd"
                                                   class="form-control form-control-lg"
                                                   required name="address"/>
                                            <label class="form-label" for="formControlLgXsd">Адрес</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="card bg-dark">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-success btn-block btn-lg">
                            Сделать заказ
                        </button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</@t.template>