<% var item = page; %>
{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" %}
    {{ __('title.category') + page_title_suffix }}
  {% elif page.type === "tags" %}
    {{ __('title.tag') + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}
  <div class="container main-container">
    <div class="card about-page row">
      <div class="blue">
                <div class="avatar-wrapper center-align" style="padding-top:20px;">
                    <img class="avatar-image circle responsive-img" src="/images/avtar.jpg" alt="用户头像">
                </div>
                <div class="info center">
                    <p class="name center">{{site.data.about.name}}</p>
                    <p class="desc center">{{site.data.about.desc}}</p>
                </div>

                {% if site.data.about.link && site.data.about.link.social %}
                <div class="social-group center-align">
                      {% for key,url in site.data.about.link.social %}
                        <a class="social-link" href={{url}} target="_blank" style="color:#555;">
                            <i class="fa fa-2x fa-{{key}}"></i>
                        </a>
                      {% endfor %}
                </div>
                {% endif %}
      </div>
       <article>
            <div class="card-content">
                <!-- 关于 -->
                <section class="about-me">
                    <h1 class="blue-text">
                        <i class="fa fa-street-view"></i>&nbsp;关于</h1>
                    <div class="entry orange-link-context">
                        <p class="notes">{{ page.content }}</p>
                    </div>
                </section>
                <!-- 技能 -->
                {% if site.data.about.skills %}
                   <section class="skills">
                      <h1 class="blue-text">
                          <i class="fa fa-tasks"></i>&nbsp;技能</h1>
                      <ul class="skill-list">
                        {% for key,skill in site.data.about.skills %}
                          {% if (key != "" )%}
                            <li class="row">
                              <div class="col s4 m3 l2">
                                {% for i in skill %}
                                  {% if i == 1 %}
                                  <i class="fa fa-star"></i>
                                  {% elif i == 0 %}
                                  <i class="fa fa-star-o"></i>
                                  {% endif %}
                                {% endfor %}
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{key}}
                              </div>
                            </li>
                          {% else %}
                            <li>&nbsp;</li>
                          {% endif %}
                        {% endfor %}
                      </ul>
                  </section>
                {% endif %}
                <!-- 项目 -->

                {% if (site.data.about.projects &&  site.data.about.projects.length > 0) %}
                <section class="projects">
                    <h1 class="blue-text">
                        <i class="fa fa-cubes"></i>&nbsp;作品与项目</h1>
                        <div class="row">
                          {% for pro in site.data.about.projects %}
                              <div class="project-item col m6">
                                    <div class="">
                                        <div class="card medium orange-link-context">
                                            <div class="card-image">
                                                <img class="card-cover-image" src="{{ pro.image }}">
                                                <span class="card-title">{{ pro.name }}</span>
                                                <div class="card-tag">
                                                   {% for j in pro.tags %}
                                                        <span class="chip white-text orange lighten-1">{{j}}</span>
                                                    {% endfor %}
                                                </div>
                                            </div>
                                            <div class="card-content">
                                                {{ pro.description }}
                                            </div>
                                            <div class="card-action">
                                                <a class="undefined-text" href="{{ pro.link }}" target="_blank">{{ pro.link_text }}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                          {% endfor %}
                        </div>
                </section>
                {% endif %}
                <!-- 打赏 -->
                <section class="reward">
                    <div class="donate_module center">

                    {% if site.data.about.reward.length > 0 %}
                      <style type="text/css">
                        .hidden {
                            display: none;
                        }
                        .a {
                              border-bottom: 0px solid #999;
                              text-decoration: none;
                          }
                        .donate_bar a.btn_donate {
                            display: inline-block;
                            width: 82px;
                            height: 82px;
                            background: url("http://img.t.sinajs.cn/t5/style/images/apps_PRF/e_media/btn_reward.gif") no-repeat;
                            _background: url("http://img.t.sinajs.cn/t5/style/images/apps_PRF/e_media/btn_reward.gif") no-repeat;

                            -webkit-transition: background 0s;
                            -moz-transition: background 0s;
                            -o-transition: background 0s;
                            -ms-transition: background 0s;
                            transition: background 0s;
                        }
                        .donate_bar a.btn_donate:hover {
                            background-position: 0 -82px;
                        }
                        .donate_bar .donate_txt {
                            display: block;
                            color: #9d9d9d;
                            font: 14px/2 "Microsoft Yahei";
                        }
                        .bold {
                            font-weight: bold;
                        }

                        img.qrcode {
                            width: 40%;
                            /*margin-bottom: 0px;*/
                        }
                        @media only screen and (min-width: 480px) {
                            img.qrcode {
                                width: 40%;
                                /*margin-right: 10px;*/
                            }
                        }
                      </style>
                      <div id="donate_board" class="donate_bar center">
                          <a id="btn_donate" class="btn_donate" target="_self" href="javascript:;" title="打赏" ></a>
                          <span class="donate_txt">能看到这的都是真爱，打个赏呗=。=</span>
                      </div>
                      <div id="donate_guide" class="donate_bar center hidden">
                          {% for reward in site.data.about.reward %}
                              <img class="qrcode" src="{{reward}}"/>
                          {% endfor %}
                      </div>
                      <script type="text/javascript">
                          document.getElementById('btn_donate').onclick = function() {
                              $('#donate_board').addClass('hidden');
                              $('#donate_guide').removeClass('hidden');
                          }

                          function donate_on_web() {
                              $('#donate').submit();
                          }
                      </script>
                      {% endif %}
                    </div>
                </section>
            </div>
        </article>
    </div>
  </div>  
  <div id="posts" class="posts-expand">
    {# tagcloud page support #}
    {% if page.type === "tags" %}
      <div class="tag-cloud">
        <div class="tag-cloud-title">
            {{ _p('counter.tag_cloud', site.tags.length) }}
        </div>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
      </div>
    {% elif page.type === 'categories' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    {% else %}
      <!-- {{ page.content }} -->
    {% endif %}
  </div>

{% endblock %}
{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
