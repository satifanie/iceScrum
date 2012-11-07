%{--
- Copyright (c) 2010 iceScrum Technologies.
-
- This file is part of iceScrum.
-
- iceScrum is free software: you can redistribute it and/or modify
- it under the terms of the GNU Affero General Public License as published by
- the Free Software Foundation, either version 3 of the License.
-
- iceScrum is distributed in the hope that it will be useful,
- but WITHOUT ANY WARRANTY; without even the implied warranty of
- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- GNU General Public License for more details.
-
- You should have received a copy of the GNU Affero General Public License
- along with iceScrum.  If not, see <http://www.gnu.org/licenses/>.
-
- Authors:
-
- Vincent Barrier (vbarrier@kagilum.com)
- Manuarii Stein (manuarii.stein@icescrum.com)
--}%
%{--Add button--}%
<g:if test="${request.productOwner}">
    <li class="navigation-item button-ico button-add">
        <a class="tool-button button-n"
           href="#feature/add"
           data-shortcut="ctrl+n"
           data-shortcut-on="#window-id-${controllerName}"
           title="${message(code:'is.ui.feature.toolbar.alt.new')}"
           alt="${message(code:'is.ui.feature.toolbar.alt.new')}">
                <span class="start"></span>
                <span class="content">
                    <span class="ico"></span>
                    ${message(code: 'is.ui.feature.toolbar.new')}
                </span>
                <span class="end"></span>
        </a>
    </li>

    <li class="navigation-item button-ico button-delete separator">
        <a class="tool-button button-n"
           onclick="jQuery.icescrum.selectableAction('feature/delete',null,null,function(data){ jQuery.event.trigger('remove_feature',[data]); jQuery.icescrum.renderNotice('${message(code:'is.feature.deleted')}'); });"
           data-shortcut="del"
           data-shortcut-on="#window-id-${controllerName}"
           alt="${message(code:'is.ui.feature.toolbar.alt.delete')}"
           title="${message(code:'is.ui.feature.toolbar.alt.delete')}">
                <span class="start"></span>
                <span class="content">
                    <span class="ico"></span>
                    ${message(code: 'is.ui.feature.toolbar.delete')}
                </span>
                <span class="end"></span>
        </a>
    </li>
</g:if>

%{--View--}%
<is:panelButton alt="View" id="menu-display" arrow="true" icon="view" separator="${request.productOwner}">
    <ul>
        <li class="first">
            <a href="${createLink(action:'list',controller:controllerName,params:[product:params.product])}"
               data-default-view="postitsView"
               data-ajax-begin="$.icescrum.setDefaultView"
               data-ajax-update="#window-content-${controllerName}"
               data-ajax="true">${message(code:'is.view.postitsView')}</a>
        </li>
        <li class="last">
            <a href="${createLink(action:'list',controller:controllerName,params:[product:params.product, viewType:'tableView'])}"
               data-default-view="tableView"
               data-ajax-begin="$.icescrum.setDefaultView"
               data-ajax-update="#window-content-${controllerName}"
               data-ajax="true">${message(code:'is.view.tableView')}</a>
        </li>
    </ul>
</is:panelButton>

<is:panelButton
        alt="Charts"
        id="menu-chart"
        arrow="true"
        icon="graph"
        separator="true"
        text="${message(code:'is.ui.toolbar.charts')}">
    <ul>
        <li class="first">
            <a href="#${controllerName}/productParkingLotChart">${message(code:'is.ui.feature.charts.productParkingLot')}</a>
        </li>
    </ul>
</is:panelButton>

%{--Print button--}%
<is:reportPanel
        separator="true"
        action="print"
        text="${message(code: 'is.ui.toolbar.print')}"
        formats="[
                  ['PDF', message(code:'is.report.format.pdf')],
                  ['RTF', message(code:'is.report.format.rtf')],
                  ['DOCX', message(code:'is.report.format.docx')],
                  ['ODT', message(code:'is.report.format.odt')]
                ]"/>
<entry:point id="${controllerName}-${actionName}-toolbar"/>
%{--Search--}%
<is:panelSearch id="search-ui">
    <is:autoCompleteSearch elementId="autoCmpTxt" controller="feature" action="list" update="window-content-${controllerName}"/>
</is:panelSearch>
