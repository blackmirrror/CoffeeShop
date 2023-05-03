<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Корзина</h1>
    <hr>
    <br>
    <#list products as product>
        <p>${product.title} | ${product.price}</p>
        <form action="/cart/remove" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="hidden" name="productId" value="${product.id}">
            <button type="submit" class="btn btn-success">
                Удалить
            </button>
        </form>
    </#list>
</@t.template>