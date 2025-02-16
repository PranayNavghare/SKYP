<jsp:include  page="/include/header.jsp"/>

<div class="support-container">
        <div class="support-header">
            <h2>How Can We Help?</h2>
            <p>Our support team is here to ensure your success with SKYP</p>
        </div>

        <form class="support-form">
            <div class="form-group">
                <input type="text" placeholder="Your Account ID" required>
            </div>
            <div class="form-group">
                <textarea placeholder="Tell us what's on your mind..." rows="5" required></textarea>
            </div>
            <button type="submit" class="submit-btn">
                <i class="fas fa-paper-plane"></i> Send Request
            </button>
        </form>

        <div class="support-features">
            <div class="feature-card">
                <i class="fas fa-comments"></i>
                <h3>24/7 Chat Support</h3>
                <p>Get instant help from our expert team</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-book"></i>
                <h3>Knowledge Base</h3>
                <p>Browse our comprehensive guides</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-video"></i>
                <h3>Video Tutorials</h3>
                <p>Learn through visual demonstrations</p>
            </div>
        </div>
    </div>
    
<jsp:include  page="/include/footer.jsp"/>