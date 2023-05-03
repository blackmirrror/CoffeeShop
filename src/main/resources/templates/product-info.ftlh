<#import "blocks/template.ftlh" as t>
<@t.template user>
<#--    <div id="myCarousel" class="carousel slide" data-ride="carousel">-->
<#--        <ol class="carousel-indicators">-->
<#--            <#list images as image>-->
<#--                <li data-target="#myCarousel" data-slide-to="0" class=""></li>-->
<#--            </#list>-->
<#--        </ol>-->
<#--        <div class="carousel-inner">-->
<#--            <#list images as image>-->
<#--                <div class="carousel-item <#if image.previewImage>active</#if>">-->
<#--                    <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"-->
<#--                         role="img" aria-label=" :  " preserveAspectRatio="xMidYMid slice" focusable="false">-->
<#--                        <title></title>-->
<#--                        <rect width="100%" height="100%" fill="#777"></rect>-->
<#--                        <text x="50%" y="50%" fill="#777" dy=".3em"></text>-->
<#--                    </svg>-->

<#--                    <div class="container">-->
<#--                        <div class="carousel-caption">-->
<#--                            <a href="/images/${image.id}">-->
<#--                                <img class="product" style="height: 100px" src="/images/${image.id}">-->
<#--                            </a>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </#list>-->

<#--        </div>-->
<#--        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">-->
<#--            <span class="carousel-control-prev-icon" aria-hidden="true"></span>-->
<#--            <span class="sr-only">Previous</span>-->
<#--        </a>-->
<#--        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">-->
<#--            <span class="carousel-control-next-icon" aria-hidden="true"></span>-->
<#--            <span class="sr-only">Next</span>-->
<#--        </a>-->
<#--    </div>-->
    <div style="width: fit-content" class="mx-auto">
        <img src="/images/${product.previewImageId}" class="img-fluid" alt="Responsive image">
    </div>
    <hr>
    <p><h1 style="text-align: center">${product.title}</h1></p>
    <p><h2 style="text-align: center">${product.price} ₽</h2></p>
    <p style="text-align: center">${product.description}</p>
    <p style="text-align: center">${product.kal}</p>
    <#if product.weights??>
        <div style="width: fit-content" class="mx-auto">
            <div class="btn-group btn-group-toggle ml-10" style="text-align: center" data-toggle="buttons">
                <#list product.weights as w>
                    <label class="btn btn-secondary">
                        <input type="radio" name="options" id="option1" autocomplete="off">${w}
                    </label>
                </#list>
            </div>
        </div>
    </#if>
    <br>
<form action="/cart/add" method="post" style="text-align: center">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <input type="hidden" name="productId" value="${product.id}">
    <button type="submit" class="btn btn-success">
        В корзину
    </button>
</@t.template>