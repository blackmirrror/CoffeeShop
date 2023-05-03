<#import "blocks/template.ftlh" as t>
<@t.template user>
<#--    <h1 style="text-align: center">Поиск товаров</h1><hr>-->
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
                    <a href="/product/${product.id}" class="product-link">
                        <div class="card text-white bg-dark my-3 product">

                            <img src="/images/${product.previewImageId}"
                                 class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.price} ₽</p>
                            </div>
                            <div class="card-footer">
                                ${product.category}
                            </div>
                        </div>
                    </a>
                </#if>
            <#else>
                <h1 style="text-align: center">Упс... Ничего нет</h1>
            </#list>
        </div>
    </#list>
</@t.template>