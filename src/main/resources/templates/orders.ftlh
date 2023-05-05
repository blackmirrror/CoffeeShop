<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h2 class='mb-3'>Ваши заказы</h2>
    <table id="dtBasicExample" class="table" width="100%">
        <thead>
        <tr>
            <th class="th-sm">Дата
            </th>
            <th class="th-sm">Адрес
            </th>
            <th class="th-sm">Статус
            </th>
            <th class="th-sm">Заказ
            </th>
        </tr>
        </thead>
        <tbody>
        <#list orders as order>
            <tr>
                <td>${order.dateOfCreated}</td>
                <td>${order.address}</td>
                <td><#if order.status == 0>Ждет подтверждения
                    <#elseif order.status == 1>Подтвержден
                    <#elseif order.status == 2>В готовке
                    <#elseif order.status == 3>В доставке
                    <#else>Завершен
                    </#if>
                </td>
                <td>
                    <a class="link-info link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" style="text-align: center; width: 100%"
                       data-toggle="collapse" href="#collapseExample${order.id}"
                       aria-expanded="true" aria-controls="collapseExample">
                        Посмотреть подробную информацию
                    </a>
                    <div class="collapse mb-3" id="collapseExample${order.id}" style="">
                        <#list order.cartItems as item>
                            ${item.product.title} ${item.weight}  = ${item.product.price} ₽
                        </#list>
                    </div>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
    <br>
    <#if user.isAdmin()>
        <h2 class='mb-3'>Текущие заказы</h2>
        <table id="dtBasicExample" class="table" width="100%">
            <thead>
            <tr>
                <th class="th-sm">Имя
                </th>
                <th class="th-sm">Телефон
                </th>
                <th class="th-sm">Адрес
                </th>
                <th class="th-sm">Дата
                </th>
                <th class="th-sm">Заказ
                </th>
                <th class="th-sm">Текущий статус
                </th>
                <th class="th-sm">Изменить статус
                </th>
            </tr>
            </thead>
            <tbody>
            <#list user_orders as user_order>
                <tr>
                    <td>${user_order.name}</td>
                    <td>${user_order.phoneNumber}</td>
                    <td>${user_order.address}</td>
                    <td>${user_order.dateOfCreated}</td>
                    <td>
                        <a class="link-info link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" style="text-align: center; width: 100%"
                           data-toggle="collapse" href="#collapseExampleUser${user_order.id}"
                           aria-expanded="true" aria-controls="collapseExample">
                            Посмотреть подробную информацию
                        </a>
                        <div class="collapse mb-3" id="collapseExampleUser${user_order.id}" style="">
                            <#list user_order.cartItems as item>
                                ${item.product.title} ${item.weight}  = ${item.product.price} ₽
                            </#list>
                        </div></td>
                    <td><#if user_order.status == 0>Ждет подтверждения
                        <#elseif user_order.status == 1>Подтвержден
                        <#elseif user_order.status == 2>В готовке
                        <#elseif user_order.status == 3>В доставке
                        <#else>Завершен
                        </#if></td>
                    <td>
                        <form action="/order/change" method="post">
                            <button class="btn btn-success" type="submit" name="order_id" value="${user_order.id}">
                                <#if user_order.status == 0>Подтвердить
                                <#elseif user_order.status == 1>В готовке
                                <#elseif user_order.status == 2>В доставке
                                <#else>Завершить
                                </#if>
                            </button>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </#if>

</@t.template>