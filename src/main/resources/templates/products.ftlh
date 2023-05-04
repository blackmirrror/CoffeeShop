<#import "blocks/template.ftlh" as t>
<@t.template user>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCategory">Категория</label>
                <select id="searchCategory" class="form-control">
                    <option value="">Все</option>
                    <option value="Кофе">Кофе</option>
                    <option value="Другие напитки">Другие напитки</option>
                    <option value="Здоровая еда">Здоровая еда</option>
                    <option value="Сладкое и выпечка">Сладкое и выпечка</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <#list categories as c>
        <h3>${c}</h3><hr>
        <div class="card-columns">
            <#list products as product>
                <#if product.category == c>
                        <div class="card text-white bg-dark my-3 product">
                            <a href="/product/${product.id}">
                            <img src="/images/${product.previewImageId}"
                                 class="card-img-top">
                            </a>
                            <form action="/cart/add" method="post" enctype="multipart/form-data">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.price} ₽</p>
                                <div style="width: fit-content; margin-bottom: 20px" class="mx-auto">
                                    <div class="btn-group btn-group-toggle ml-10" data-toggle="buttons">
                                        <#list product.weights as w>
                                            <label class="btn btn-secondary">
                                                <input type="radio" required name="weight" autocomplete="off" value="${w}">${w}
                                            </label>
                                        </#list>
                                    </div>
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="count" value="1"/>
                                <#if user.email??>
                                    <input type="hidden" required name="userId" value="${user.id}"/>
                                </#if>
                                <button type="submit" class="btn btn-success">
                                    В корзину
                                </button>
                            </div>
                            </form>
                        </div>
                </#if>
            <#else>
                <h1 style="text-align: center">Упс... Ничего нет</h1>
            </#list>
        </div>
    </#list>
</@t.template>