{%- extends 'slides_reveal.tpl' -%}

{% block body %}

{{ super() }}

<script>


require(
    {
      // it makes sense to wait a little bit when you are loading
      // reveal from a cdn in a slow connection environment
      waitSeconds: 15
    },
    [
      "reveal.js/lib/js/head.min.js",
      "reveal.js/js/reveal.js"
    ],

    function(head, Reveal){

        // Full list of configuration options available here: https://github.com/hakimel/reveal.js#configuration
        Reveal.initialize({
            controls: true,
            progress: true,
            history: true,

            theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
            transition: Reveal.getQueryHash().transition || 'linear', // default/cube/page/concave/zoom/linear/none

            // Optional libraries used to extend on reveal.js
            dependencies: [
                { src: "reveal.js/lib/js/classList.js",
                  condition: function() { return !document.body.classList; } },
                { src: "reveal.js/plugin/notes/notes.js",
                  async: true,
                  condition: function() { return !!document.body.classList; } }
            ]
        });

        var update = function(event){
          if(MathJax.Hub.getAllJax(Reveal.getCurrentSlide())){
            MathJax.Hub.Rerender(Reveal.getCurrentSlide());
          }
        };

        Reveal.addEventListener('slidechanged', update);

        var update_scroll = function(event){
          $(".reveal").scrollTop(0);
        };

        Reveal.addEventListener('slidechanged', update_scroll);

    }
);
</script>

{% endblock body %}
