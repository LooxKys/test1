<div class="demo-section k-content wide">
    <input id="id" style="width: 100%;" />
    <input id="chuhs" style="width: 100%;" />
    <input id="loaima" style="width: 100%;background-color: aqua;" />
    <input id="ngaycap" style="width: 100%;" />
    <input id="ngayhh" style="width: 100%;" />
    <ul id="listView"></ul>
    <div id="pager" class="k-pager-wrap"></div>
</div>
<!--
<script type="text/x-kendo-tmpl" id="template">
    <div class="product-view k-widget">
        <div class="o1">
            <p>#:id#</p>
            <p>#:tenhs#</p>
        </div>
        <div class="o2">
            <p>#:chuhs#</p>
            <p>#:loaima#</p>
        </div>
        <div class="o3">
            <p>#:ngaycap#</p>
            <p>#:ngayhh#</p>
        </div>
    </div>
</script>
-->
<script type="text/x-kendo-tmpl" id="template">
    <li id = "li">
        <div class="o1">
            <p>#:id#</p>
            <p>#:tenhs#</p>
        </div>
        <div class="o2">
            <p>#:chuhs#</p>
            <p>#:loaima#</p>
        </div>
        <div class="o3">
            <p>#:ngaycap#</p>
            <p>#:ngayhh#</p>
        </div>
    </li>
</script>
<script type="text/x-kendo-tmpl" id="editTemplate">
    <div class="product-view k-widget">
        <div class="o1">
            <input type="text" class="k-textbox" data-bind="value:id" name="id" required="required" validationMessage="required" /> <span data-for="id" class="k-invalid-msg"></span>
            <input type="text" class="k-textbox" data-bind="value:tenhs" name="tenhs" required="required" validationMessage="required" /> <span data-for="tenhs" class="k-invalid-msg"></span> </div>
        <div class="o2">
            <input type="text" class="k-textbox" data-bind="value:chuhs" name="chuhs" required="required" validationMessage="required" /> <span data-for="chuhs" class="k-invalid-msg"></span>
            <input type="text" class="k-textbox" data-bind="value:loaima" name="loaima" required="required" validationMessage="required" /> <span data-for="loaima" class="k-invalid-msg"></span> </div>
        <div class="o3">
            <input type="text" class="k-textbox" data-bind="value:ngaycap" name="ngaycap" required="required" validationMessage="required" /> <span data-for="ngaycap" class="k-invalid-msg"></span>
            <input type="text" class="k-textbox" data-bind="value:ngayhh" name="ngayhh" required="required" validationMessage="required" /> <span data-for="ngayhh" class="k-invalid-msg"></span> </div>
    </div>
</script>
<script>
    $(function () {
        var dataSource = new kendo.data.DataSource({
            type: "json"
            , transport: {
                read: {
                    url: "datasource/cb.json"
                    , dataType: "json"
                }
                , parameterMap: function (options, operation) {
                    if (operation !== "read" && options.models) {
                        return {
                            models: kendo.stringify(options.models)
                        };
                    }
                }
            }
            , pageSize: 2
            , batch: true
            , schema: {
                total: "total"
                , data: "data"
            }
        });
        $("#pager").kendoPager({
            dataSource: dataSource
        });
        var listView = $("#listView").kendoListView({
            dataSource: dataSource
            , template: kendo.template($("#template").html())
            , editTemplate: kendo.template($("#editTemplate").html())
        }).data("kendoListView");
        $("#id").kendoAutoComplete({
            dataTextField: "id"
            , filter: "contains"
            , minLength: 1
            , dataSource: dataSource
        });
        $("#chuhs").kendoAutoComplete({
            dataTextField: "chuhs"
            , filter: "contains"
            , minLength: 1
            , dataSource: dataSource
        });
        $("#ngaycap").kendoAutoComplete({
            dataTextField: "ngaycap"
            , filter: "contains"
            , minLength: 1
            , dataSource: dataSource
        });
        $("#ngayhh").kendoAutoComplete({
            dataTextField: "ngayhh"
            , filter: "contains"
            , minLength: 1
            , dataSource: dataSource
        });
        $("#loaima").kendoDropDownList({
            dataTextField: "loaima"
            , dataValueField: "id"
            , filter: "contains"
            , dataSource: dataSource
        });
    });
</script>