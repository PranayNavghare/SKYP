<jsp:include page="/include/header.jsp"/>

<section class="contact-container">
        <div class="contact-box">
            <h2>Contact Us</h2>
            <form>
                <div class="input-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" placeholder="Enter your name" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="message">Message</label>
                    <textarea id="message" placeholder="Write your message" required></textarea>
                </div>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </section>

<jsp:include page="/include/footer.jsp"/>