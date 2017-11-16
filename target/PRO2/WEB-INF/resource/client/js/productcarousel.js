class HomeProductCarousel{
    
        constructor(elements) {
            this.$elements = $(elements);
            this.list = [];
            this._addEvent();
            console.log(1);
        }
    
        _addEvent(){
            const component = this;
            this.options = {
                slidesPerView: 4,
                slidesPerGroup: 4,
                spaceBetween: 0,
                preventClicks: true,
                preventClicksPropagation: true,
                onTransitionEnd: this._onTransitionEnd.bind(this)
            };
    
            this.$elements.find('.tab-pane.active').map((index, item) => {
                const $item = $(item);
                const $swiperContainer = $item.find('.swiper-container');
    
                this.options.nextButton = $item.find(".swiper-button-next");
                this.options.prevButton = $item.find(".swiper-button-prev");
                component.list.push(new Swiper($swiperContainer,this.options));
                this.$elements.find('.swiper-slide').css("height", "366px");
                this.$elements.find('.product-item').css("height", "100%");
            });
    
            this.$elements.on('shown.bs.tab', this._shownTab.bind(this));
    
            
            this.$elements.find('.product-item').on("click", "a", function(e) {
                window.location.href = $(this).attr('href');
            });
        }
    
        _shownTab(e){
            const $element = $(e.currentTarget);
            const $tabActive = $element.find(".tab-pane.active");
            const $swiperContainer = $tabActive.find('.swiper-container');
    
            if(typeof $swiperContainer[0].swiper === 'undefined'){
                this.options.nextButton = $tabActive.find(".swiper-button-next");
                this.options.prevButton = $tabActive.find(".swiper-button-prev");
                this.list.push(new Swiper($swiperContainer, this.options));
            }
    
            this._lazyLoad($swiperContainer);
            let $text = $element.find(".nav-tabs .active").text().trim();
            let $link = $tabActive.find('.home-see-all').attr('href');
            $element.find('.see-all-face').text('Xem tất cả ' + $text);
            $element.find('.see-all-face').attr('href', $link);
        }
    
        _onTransitionEnd(swiper) {
            this._lazyLoad($(swiper.container[0]));
        }
    
        _lazyLoad(obj){
            obj.find("img.lazy").lazy({
                effect: "fadeIn",
                effectTime: 200,
                threshold: 0,
                bind: "event"
            });
        }
    }