<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Ваши заказы</h1>
    <hr>
    <br>
    <#list orders as order>
        <h2>${order.dateOfCreated}</h2>
        <h2>${order.address}</h2>
        <#list order.cartItems as cart>
            <h4>${cart.product.title}</h4>
        </#list>
        <hr>
    <#else>
        <h2>Здесь пока пусто</h2>
    </#list>
    <#if user.isAdmin()>
        <h1 style="text-align: center">Текущие заказы</h1>
        <hr>
        <br>
        <#list user_orders as user_order>
            <form action="/order/change" method="post">
                <h2>${user_order.dateOfCreated}</h2>
                <h2>${user_order.address}</h2>
                <#list user_order.cartItems as cart>
                    <h4>${cart.product.title}</h4>
                </#list>
                <hr>
                <button type="submit" name="order_id" value="${user_order.id}">
                    <#if user_order.status == 0>Подтвердить
                    <#elseif user_order.status == 1>В готовке
                    <#elseif user_order.status == 2>В доставке
                    <#else>Завершить
                    </#if>
                </button>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </#list>
    </#if>

</@t.template>