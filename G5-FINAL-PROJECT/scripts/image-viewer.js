(function () {
    if (window.__cabuyaoImageViewerInitialized) {
        return;
    }
    window.__cabuyaoImageViewerInitialized = true;

    var overlay = document.createElement('div');
    overlay.className = 'image-viewer-overlay';
    overlay.innerHTML =
        '<div class="image-viewer-shell" role="dialog" aria-modal="true" aria-label="Image viewer">' +
            '<div class="image-viewer-toolbar">' +
                '<button type="button" class="image-viewer-btn" data-action="zoom-out" aria-label="Zoom out">-</button>' +
                '<button type="button" class="image-viewer-btn" data-action="reset" aria-label="Reset zoom">Reset</button>' +
                '<button type="button" class="image-viewer-btn" data-action="zoom-in" aria-label="Zoom in">+</button>' +
                '<button type="button" class="image-viewer-btn" data-action="close" aria-label="Close viewer">x</button>' +
            '</div>' +
            '<div class="image-viewer-stage">' +
                '<div class="image-viewer-canvas">' +
                    '<img class="image-viewer-img" alt="Expanded image" />' +
                '</div>' +
            '</div>' +
        '</div>';

    function ensureOverlayMounted() {
        if (!document.body.contains(overlay)) {
            document.body.appendChild(overlay);
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', ensureOverlayMounted);
    } else {
        ensureOverlayMounted();
    }

    var canvas = overlay.querySelector('.image-viewer-canvas');
    var image = overlay.querySelector('.image-viewer-img');
    var scale = 1;
    var translateX = 0;
    var translateY = 0;
    var dragStartX = 0;
    var dragStartY = 0;
    var dragging = false;

    function render() {
        image.style.transform = 'translate(' + translateX + 'px, ' + translateY + 'px) scale(' + scale + ')';
        canvas.classList.toggle('is-draggable', scale > 1);
        canvas.classList.toggle('is-dragging', dragging);
    }

    function resetView() {
        scale = 1;
        translateX = 0;
        translateY = 0;
        dragging = false;
        render();
    }

    function clampScale(value) {
        return Math.min(5, Math.max(1, value));
    }

    function zoomBy(delta) {
        scale = clampScale(scale + delta);
        if (scale === 1) {
            translateX = 0;
            translateY = 0;
        }
        render();
    }

    function openViewer(src, alt) {
        if (!src) {
            return;
        }
        ensureOverlayMounted();
        image.src = src;
        image.alt = alt || 'Expanded image';
        resetView();
        overlay.classList.add('open');
        document.body.style.overflow = 'hidden';
    }

    function closeViewer() {
        overlay.classList.remove('open');
        image.removeAttribute('src');
        document.body.style.overflow = '';
        resetView();
    }

    document.addEventListener('click', function (event) {
        var target = event.target.closest('img[data-viewer="true"]');
        if (!target) {
            return;
        }

        event.preventDefault();
        event.stopPropagation();
        openViewer(target.getAttribute('data-viewer-src') || target.currentSrc || target.src, target.alt);
    });

    overlay.addEventListener('click', function (event) {
        if (event.target === overlay || event.target.classList.contains('image-viewer-stage')) {
            closeViewer();
        }
    });

    overlay.querySelector('.image-viewer-toolbar').addEventListener('click', function (event) {
        var button = event.target.closest('[data-action]');
        if (!button) {
            return;
        }

        switch (button.getAttribute('data-action')) {
            case 'zoom-in':
                zoomBy(0.25);
                break;
            case 'zoom-out':
                zoomBy(-0.25);
                break;
            case 'reset':
                resetView();
                break;
            case 'close':
                closeViewer();
                break;
        }
    });

    canvas.addEventListener('wheel', function (event) {
        if (!overlay.classList.contains('open')) {
            return;
        }
        event.preventDefault();
        zoomBy(event.deltaY < 0 ? 0.2 : -0.2);
    }, { passive: false });

    canvas.addEventListener('mousedown', function (event) {
        if (scale <= 1) {
            return;
        }
        event.preventDefault();
        dragging = true;
        dragStartX = event.clientX - translateX;
        dragStartY = event.clientY - translateY;
        render();
    });

    window.addEventListener('mousemove', function (event) {
        if (!dragging) {
            return;
        }
        translateX = event.clientX - dragStartX;
        translateY = event.clientY - dragStartY;
        render();
    });

    window.addEventListener('mouseup', function () {
        if (!dragging) {
            return;
        }
        dragging = false;
        render();
    });

    document.addEventListener('keydown', function (event) {
        if (!overlay.classList.contains('open')) {
            return;
        }

        if (event.key === 'Escape') {
            closeViewer();
        } else if (event.key === '+') {
            zoomBy(0.25);
        } else if (event.key === '-') {
            zoomBy(-0.25);
        }
    });
})();
