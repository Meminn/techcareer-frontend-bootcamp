$(document).ready(function () {
    let isUpdating = false;
    let updateId = null;
    const maxChars = 2000; // Maksimum harf sayısı

    // Hata mesajlarını temizleme fonksiyonu
    const clearErrors = () => {
        $(".error-message, .valid-message").remove();
    };

    // Hata mesajı ekleme fonksiyonu
    const showError = (element, message) => {
        $(element).next(".error-message, .valid-message").remove();
        $(element).after(`<small class="text-danger error-message">${message}</small>`);
    };

    // Geçerli mesajı ekleme fonksiyonu
    const showValid = (element, message) => {
        $(element).next(".error-message, .valid-message").remove();
        $(element).after(`<small class="text-success valid-message">${message}</small>`);
    };

    // İçerik harf sınırını kontrol etme fonksiyonu
    const updateCharCount = () => {
        const content = $("#content").val();
        const charCount = content.length;
        const remainingChars = maxChars - charCount;

        $("#char-count").text(`Kalan Harf Sayısı: ${remainingChars}`);

        if (remainingChars < 0) {
            $("#char-count").removeClass("text-success").addClass("text-danger");
            showError("#content", "İçerik 2000 harften fazla olamaz!");
        } else {
            $("#char-count").removeClass("text-danger").addClass("text-success");
            $(".error-message").remove();
        }
    };

    // Form doğrulama fonksiyonu
    const validateForm = () => {
        clearErrors();
        let isValid = true;
        const content = $("#content").val();
        const charCount = content.length;

        if ($("#header").val().trim() === "") {
            showError("#header", "Başlık boş bırakılamaz!");
            isValid = false;
        } else {
            showValid("#header", "Başlık geçerli.");
        }

        if (content.trim() === "") {
            showError("#content", "İçerik boş bırakılamaz!");
            isValid = false;
        } else if (charCount > maxChars) {
            showError("#content", "İçerik 2000 harften fazla olamaz!");
            isValid = false;
        } else {
            showValid("#content", "İçerik geçerli.");
        }

        if ($("#author").val().trim() === "") {
            showError("#author", "Yazar adı boş bırakılamaz!");
            isValid = false;
        } else {
            showValid("#author", "Yazar adı geçerli.");
        }

        if ($("#tags").val().trim() === "") {
            showError("#tags", "En az bir etiket eklemelisiniz!");
            isValid = false;
        } else {
            showValid("#tags", "Etiket geçerli.");
        }

        return isValid;
    };

    // Kullanıcı içerik alanına yazdıkça harf sayısını güncelle
    $("#content").on("input", function () {
        updateCharCount();
    });

    // Kullanıcı input'a yazarken hataları kaldır ve geçerli mesaj ekle
    $("#header, #author, #tags").on("input", function () {
        const field = $(this);
        if (field.val().trim() === "") {
            showError(field, "Bu alan boş bırakılamaz!");
        } else {
            showValid(field, "Geçerli.");
        }
    });

    // Formu sıfırlama fonksiyonu
    const resetForm = () => {
        $("#blog-form")[0].reset();
        isUpdating = false;
        updateId = null;
        $("#submit-btn").text("Ekle");
        clearErrors();
        updateCharCount();
    };

    // Blog listesini getir
    const fetchBlogList = () => {
        $.ajax({
            url: "/blog/api",
            method: "GET",
            success: function (data) {
                const $tbody = $("#blog-table tbody").empty();
                data.forEach(item => {
                    $tbody.append(`
                        <tr data-id="${item._id}">
                            <td>${item._id}</td>
                            <td>${item.header}</td>
                            <td>${item.content}</td>
                            <td>${item.author}</td>
                            <td>${item.tags}</td>
                            <td>${item.views}</td>
                            <td>${item.status}</td>
                            <td>${item.dateInformation}</td>
                            <td>
                                <button class="btn btn-primary edit-btn"><i class="fa-solid fa-wrench"></i></button>
                                <button class="btn btn-danger delete-btn"><i class="fa-solid fa-trash"></i></button>
                            </td>
                        </tr>
                    `);
                });
            },
            error: handleError
        });
    };

    // Hata yönetimi fonksiyonu
    const handleError = (xhr, status, error) => {
        console.error("İşlem başarısız:", error);
        alert("Beklenmeyen bir hata oluştu, lütfen tekrar deneyin.");
    };

    // Blog ekleme/güncelleme işlemi
    $("#blog-form").on("submit", function (event) {
        event.preventDefault();

        // Form doğrulama
        if (!validateForm()) {
            return;
        }

        const blogData = {
            header: $("#header").val(),
            content: $("#content").val(),
            author: $("#author").val(),
            tags: $("#tags").val(),
            _csrf: $("input[name='_csrf']").val()
        };

        if (isUpdating && updateId) {
            $.ajax({
                url: `/blog/api/${updateId}`,
                method: "PUT",
                data: blogData,
                success: function () {
                    fetchBlogList();
                    resetForm();
                },
                error: handleError
            });
        } else {
            $.ajax({
                url: "/blog/api",
                method: "POST",
                data: blogData,
                success: function () {
                    fetchBlogList();
                    resetForm();
                },
                error: handleError
            });
        }
    });

    // Blog güncelleme işlemi
    $("#blog-table tbody").on("click", ".edit-btn", function () {
        const row = $(this).closest("tr");
        const id = row.data("id");

        $("#header").val(row.find("td:eq(1)").text());
        $("#content").val(row.find("td:eq(2)").text());
        $("#author").val(row.find("td:eq(3)").text());
        $("#tags").val(row.find("td:eq(4)").text());

        isUpdating = true;
        updateId = id;
        $("#submit-btn").text("Güncelle");
    });

    // Blog silme işlemi
    $("#blog-table tbody").on("click", ".delete-btn", function () {
        const id = $(this).closest("tr").data("id");

        if (!confirm(`${id} nolu Blog'u Silmek İstiyor musunuz?`)) return;

        $.ajax({
            url: `/blog/api/${id}`,
            method: "DELETE",
            success: fetchBlogList,
            error: handleError
        });
    });

    // Sayfa yüklendiğinde blog listesini getir
    fetchBlogList();
    updateCharCount(); // Başlangıçta harf sayacını güncelle
});
