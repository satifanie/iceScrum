%{--
- Copyright (c) 2011 Kagilum SAS.
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
- Nicolas Noullet (nnoullet@kagilum.com)
--}%
<%@ page import="org.icescrum.core.domain.Story; org.icescrum.core.domain.AcceptanceTest" %>
<g:set var="acceptanceTests" value="${story.acceptanceTests}"/>
<g:set var="access" value="${request.productOwner}"/>
<is:panelTab id="tests" selected="${params.tab && 'tests' in params.tab ? 'true' : ''}">
    <div class="addorlogin">
        <sec:ifNotLoggedIn>
            <a href="${grailsApplication.config.grails.serverURL}/login?ref=p/${story.backlog.pkey}#story/${story.id}?tab=tests">
                ${message(code: 'is.ui.acceptanceTest.login')}
            </a>
        </sec:ifNotLoggedIn>
        <g:if test="${request.inProduct && story.state >= Story.STATE_SUGGESTED}">
            <is:link disabled="true"
                     onClick="jQuery('#acceptance-test-form-container').show();jQuery.icescrum.openTab('tests', true);">${message(code: 'is.ui.acceptanceTest.add')}</is:link>
        </g:if>
    </div>
    <is:cache cache="storyCache" key="story-tests-${story.id}-${AcceptanceTest.findLastUpdated(story.id).list()[0]}">
        <ul class="list-acceptance-tests">
            <g:if test="${!acceptanceTests || acceptanceTests.size() == 0}">
                <li class="panel-box-empty">${message(code: 'is.ui.acceptanceTest.empty')}</li>
            </g:if>
            <g:render template="/acceptanceTest/acceptanceTest"
                        collection="${acceptanceTests}"
                        var="acceptanceTest"
                        model="[access:access, user:user]"/>
        </ul>
    </is:cache>
    <g:if test="${request.inProduct}">
        <div id="addComment" class="addComment">
            <g:render template="/acceptanceTest/acceptanceTestForm"
                      model="[parentStory:story, hidden:true]"/>
        </div>
    </g:if>
 </is:panelTab>